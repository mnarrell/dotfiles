# Migrating from asdf to mise

asdf has been removed. Its seven tools were redistributed to whichever owner
actually fits them, rather than moved wholesale to mise:

| owner | tools | why |
| --- | --- | --- |
| **mise** | `go`, `node`, `ruby` | version may vary per project |
| **Homebrew** | `helm`, `kubectl`, `opentofu` | latest is always fine |
| **uv** | `python` | per-project, as it already was |

The SDKs are the one place a version manager earns its keep here. Homebrew
does install `node` and `python@3.14`, but as *substrate* — dependencies of
prettier, markdownlint-cli, opencode, jsonlint / ansible, pre-commit and
yamllint. Those copies move whenever the formulae depending on them move, so
they cannot be pinned and are not for direct use.

mise's tool versions live in `mise/config.toml`, which is symlinked to
`~/.config/mise/config.toml` and tracked in git — unlike `~/.tool-versions`,
which was never version-controlled.

---

## Rolling this out to another machine

**This is not a plain `git pull`.** Read the trap below first.

### The `~/.tool-versions` trap

`~/.tool-versions` was untracked, so it still exists on every machine that
hasn't been migrated. Two things collide the moment such a machine pulls:

- `zsh/path.zsh` no longer adds asdf's shims, and `asdf/env.zsh` is gone, so
  `ASDF_DATA_DIR` is unset. **Every asdf-provided tool drops off `PATH`
  immediately.**
- mise reads `~/.tool-versions` as a global config file, and **it takes
  precedence over `~/.config/mise/config.toml`**. It also uses asdf's names
  (`golang`, `nodejs`), which are not in mise's registry.

The result is a window where `go`, `node`, `ruby`, `python` and `tofu` have no
provider at all, while mise is being steered by a file you assumed was dead.
Nothing in this repo can prevent that — the file must be deleted by hand.

### 1. Install the new tools before the old ones disappear

```bash
git -C ~/.dotfiles pull
brew bundle            # HOMEBREW_BUNDLE_FILE is set per-machine by .envrc
                       # installs mise, helm, kubernetes-cli
```

### 2. Delete the stale version file

```bash
cp ~/.tool-versions ~/.tool-versions.bak   # keep an escape hatch
rm ~/.tool-versions
```

### 3. Install what mise now owns

```bash
mise install           # go, node, ruby, from mise/config.toml
```

### 4. Verify in a fresh shell, before removing anything

```bash
exec zsh -l            # must produce no output at all
mise ls                # go, node, ruby — sourced from mise/config.toml
mise doctor            # "No problems found"
which go node ruby helm kubectl tofu python3
```

`go`, `node` and `ruby` should resolve under `~/.local/share/mise/installs`;
`helm`, `kubectl`, `tofu` and `python3` under `/opt/homebrew/bin`.

If `mise ls` still shows `golang` or `nodejs` sourced from `~/.tool-versions`,
step 2 did not take effect.

### 5. Remove asdf

Plain `brew bundle` only installs, so dropping `brew 'asdf'` from the Brewfiles
does not remove it from any machine.

`brew bundle cleanup` does remove formulae that are no longer listed, but it
removes **everything** unlisted, not just asdf — including anything installed
ad hoc. Always read the dry run first:

```bash
brew bundle cleanup           # dry run: lists what would go
brew bundle cleanup --force   # only if that list is entirely expected
```

Formulae kept as dependencies of listed ones are safe, so `helm` survives via
`helmfile`. Directly installed tools that never made it into a Brewfile do not.
For a single formula, the targeted removal avoids the blast radius entirely:

```bash
brew uninstall asdf
rm -rf ~/.local/share/asdf ~/.asdf ~/.config/asdf
```

### 6. Redeploy configuration

```bash
task default
```

This is **not** optional. Each machine's `nvim/.venv` was built against *that
machine's* asdf Python and its interpreter symlink is now dangling, which
breaks Neovim's Python provider. `task nvim:up` rebuilds it against uv's own
managed CPython, so it no longer depends on an interpreter another formula
controls.

`task helm:up` also installs `helm-diff`, which had never installed
successfully: helm 4 verifies plugin provenance by default and helm-diff
publishes none, so the install failed and `ignore_error` hid it. It now passes
`--verify=false`.

Confirm afterwards:

```bash
nvim --headless "+checkhealth provider" +qa   # Node, Python, Ruby all OK
helm plugin list                              # diff present
```

---

## Rolling back

`git revert` is not sufficient. It restores the repo but not machine state —
asdf would still be uninstalled and `~/.tool-versions` still deleted. A real
rollback is:

```bash
brew install asdf
cp ~/.tool-versions.bak ~/.tool-versions
asdf plugin add golang && asdf plugin add nodejs   # and so on per tool
asdf install
```

Keep `~/.tool-versions.bak` somewhere durable if you want a genuine escape
hatch — it lives in `$HOME`, is untracked, and is one `rm` from gone.

---

## Notes

- **Unversioned `python` and `pip` are gone.** Homebrew ships only `python3`
  and `pip3`. The only place in this repo that depended on the short names was
  the Ansible language server, which now uses `python3`.
- **`GOROOT` is no longer set by this repo.** mise's `core:go` backend exports
  it for the active toolchain, and `GOTOOLCHAIN=auto` fetches whatever a given
  `go.mod` requires on top of that. `GOPATH` and `GOBIN` are unchanged.
- **Adding a tool to mise** is `mise use -g <tool>@<version>`, which writes to
  `mise/config.toml` in this repo. Commit the result.
- **Prefer Homebrew** unless a tool's version is a constraint you need to
  state. mise earns its keep for per-project SDK versions, not for CLIs where
  latest is always fine.
