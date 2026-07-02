#!/usr/bin/env bash
#
# Reapply the known-good tmux 3.7 downgrade.
#
# Background: tmux 3.7a (and any bottle built against a mismatched utf8proc)
# breaks ALL TUI rendering inside panes (nvim, opencode, etc. show nothing).
# This re-pours the verified tmux 3.7 bottle straight from Homebrew's permanent
# ghcr.io registry, relocates it exactly like `brew` would, links, and pins it.
# No tap, no source build.
#
# Usage:
#   reapply-tmux-3.7.sh [bottle_tag]
#   # bottle_tag defaults to auto-detected (e.g. arm64_tahoe). Override if needed.
#
set -euo pipefail

VERSION="3.7"
# homebrew-core commit "tmux: update 3.7 bottle" (last good 3.7 before 3.7a).
FORMULA_COMMIT="cfa3df3ecd8abc0f21b9b664633becd9003bcbeb"

PREFIX="$(brew --prefix)"
CELLAR="$PREFIX/Cellar"
KEG="$CELLAR/tmux/$VERSION"

log() { printf '==> %s\n' "$*"; }
die() { printf 'error: %s\n' "$*" >&2; exit 1; }

# --- work dir ----------------------------------------------------------------
WORK="$(mktemp -d)"
trap 'rm -rf "$WORK"' EXIT

# --- determine the bottle tag for this machine -------------------------------
arch="$(uname -m)"   # arm64 or x86_64
if [[ $# -ge 1 ]]; then
  TAG="$1"
else
  major="$(sw_vers -productVersion | cut -d. -f1)"
  case "$major" in
    26) code=tahoe ;;
    15) code=sequoia ;;
    14) code=sonoma ;;
    13) code=ventura ;;
    *) die "unknown macOS major version '$major'; pass the bottle tag explicitly (e.g. ${arch}_sequoia)" ;;
  esac
  # Apple Silicon bottles are tagged arm64_<code>; Intel macOS bottles are just <code>.
  if [[ "$arch" == "arm64" ]]; then TAG="arm64_${code}"; else TAG="${code}"; fi
fi
log "target: tmux $VERSION   bottle tag: $TAG"

# --- fetch the pinned formula, pull the sha256 for our tag -------------------
FORMULA_URL="https://raw.githubusercontent.com/Homebrew/homebrew-core/${FORMULA_COMMIT}/Formula/t/tmux.rb"
curl -fsSL "$FORMULA_URL" -o "$WORK/tmux.rb" || die "could not fetch formula"
SHA="$(grep -E "sha256 cellar: :any, ${TAG}:" "$WORK/tmux.rb" | grep -oE '[0-9a-f]{64}' | head -1 || true)"
if [[ -z "$SHA" ]]; then
  echo "no bottle for tag '$TAG'. Tags available in this formula:" >&2
  grep -oE '(arm64_[a-z0-9]+|x86_64_[a-z0-9]+|sonoma|ventura|monterey):' "$WORK/tmux.rb" | tr -d ':' | sort -u >&2
  die "pick one of the above and pass it as an argument"
fi
log "bottle sha256: $SHA"

# --- download the bottle from ghcr.io and verify -----------------------------
TOKEN="$(curl -fsSL "https://ghcr.io/token?service=ghcr.io&scope=repository:homebrew/core/tmux:pull" \
         | sed -n 's/.*"token":"\([^"]*\)".*/\1/p')"
[[ -n "$TOKEN" ]] || die "could not obtain ghcr.io token"
BOTTLE="$WORK/tmux-${VERSION}.${TAG}.bottle.tar.gz"
curl -fsSL -H "Authorization: Bearer $TOKEN" \
     "https://ghcr.io/v2/homebrew/core/tmux/blobs/sha256:$SHA" -o "$BOTTLE" \
     || die "bottle download failed"
GOT="$(shasum -a 256 "$BOTTLE" | awk '{print $1}')"
[[ "$GOT" == "$SHA" ]] || die "checksum mismatch: got $GOT expected $SHA"
log "checksum verified"

# --- snapshot an existing install receipt if one is present ------------------
RECEIPT_SRC="$(ls "$CELLAR"/tmux/*/INSTALL_RECEIPT.json 2>/dev/null | head -1 || true)"
if [[ -n "$RECEIPT_SRC" ]]; then cp "$RECEIPT_SRC" "$WORK/INSTALL_RECEIPT.json"; fi

# --- swap the keg ------------------------------------------------------------
brew unpin tmux 2>/dev/null || true
brew uninstall --force tmux 2>/dev/null || true
rm -rf "$KEG"
tar -xzf "$BOTTLE" -C "$CELLAR"
[[ -d "$KEG" ]] || die "bottle did not extract to $KEG"

if [[ -f "$WORK/INSTALL_RECEIPT.json" ]]; then
  cp "$WORK/INSTALL_RECEIPT.json" "$KEG/INSTALL_RECEIPT.json"
else
  printf '{"homebrew_version":"manual-pour","poured_from_bottle":true,"installed_on_request":true,"installed_as_dependency":false,"runtime_dependencies":[]}\n' \
    > "$KEG/INSTALL_RECEIPT.json"
fi

# --- relocate @@HOMEBREW_*@@ placeholders in the binary, then re-sign ---------
# (raw `tar` skips the relocation `brew` normally does during pour.)
BIN="$KEG/bin/tmux"
otool -L "$BIN" | awk '/@@HOMEBREW/{print $1}' | while read -r ref; do
  new="${ref//@@HOMEBREW_PREFIX@@/$PREFIX}"
  new="${new//@@HOMEBREW_CELLAR@@/$CELLAR}"
  install_name_tool -change "$ref" "$new" "$BIN"
done
codesign --force --sign - "$BIN"   # re-sign ad-hoc; Apple Silicon won't run an invalid sig

# --- link + pin --------------------------------------------------------------
brew link --overwrite tmux
brew pin tmux
log "installed $("$BIN" -V) and pinned"

# --- quick render self-check -------------------------------------------------
if command -v nvim >/dev/null 2>&1; then
  sock="$(mktemp -u "$WORK/sock.XXXXXX")"
  probe="OK_PROBE_$$"
  tmux -f /dev/null -S "$sock" new-session -d -x 80 -y 24 \
    "nvim -u NONE +\"call setline(1,['$probe'])\"" 2>/dev/null || true
  sleep 2
  if tmux -S "$sock" capture-pane -p 2>/dev/null | grep -q "$probe"; then
    log "RENDER OK — TUIs render correctly"
  else
    log "WARNING: render self-check did not see the probe; run 'verify-tmux' to double-check"
  fi
  tmux -S "$sock" kill-server 2>/dev/null || true
fi
