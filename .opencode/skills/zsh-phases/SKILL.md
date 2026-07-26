---
name: zsh-phases
description: Use when editing this repo's zsh phase files, adding tools with zsh config, or debugging PATH/fpath/completion/prompt breakage. Covers the phase order, execution model, and the five critical footguns.
---

# zsh Initialization Phases

This repo uses a phase-based zsh startup model to keep initialization explicit and maintainable. Each tool drops phase-specific files into `$XDG_CONFIG_HOME/<tool>/` and `.zshrc` loads them in order, ensuring predictable behavior and clear dependencies.

## Phase Model & Order

The complete startup sequence (defined in `zsh/.zshrc`):

1. **env.zsh** — Exports only (no PATH edits, no commands). Must run first so all phases inherit tool-specific env vars.
   - File: `zsh/env.zsh`, `<tool>/env.zsh`
   - Examples: `golang/env.zsh` sets `$GOBIN`

2. **path.zsh** — Adds to `$path`, `$manpath`, `$fpath`. Must run before any tool that prepends/appends its bin dir.
   - File: `zsh/path.zsh`, `<tool>/path.zsh`
   - Examples: `golang/path.zsh` appends `$GOBIN`; `gnu/path.zsh` prepends GNU bin

3. **completions.zsh** — fpath additions, zstyles, autoloads (pre-compinit setup).
   - File: `zsh/completions.zsh`, `<tool>/completions.zsh`
   - Purpose: Prime the completion system before `compinit` runs

4. **compinit runs** — The zsh completion framework initializes, scanning `$fpath` for `_*` functions and building the dump.
   - Dump location: `$XDG_CACHE_HOME/zsh/zcompdump-${ZSH_VERSION}`
   - Fast path: `-C` flag skips security checks if dump is fresh

5. **compdef.zsh** — `compdef` calls and tool-specific completions (post-compinit setup).
   - File: `zsh/compdef.zsh`, `<tool>/compdef.zsh`
   - Examples: `opentofu/compdef.zsh` registers bash-completion; `ruff/compdef.zsh` wraps UV completers

6. **init.zsh** — Interactive shell setup: hooks, prompt, keybinds, options.
   - File: `zsh/init.zsh` (loads `zsh/init.d/NN-*.zsh` in numeric order)
   - Fragments in `zsh/init.d/`:
     - `10-setopts.zsh` — Shell options (autocd, extendedglob, history flags, etc.)
     - `20-history.zsh` — History configuration
     - `30-functions.zsh` — Interactive functions (navigation, etc.)
     - `40-extensions.zsh` — Additional zle widgets or key bindings
     - `50-prompt.zsh` — Prompt setup (runs last, depends on earlier settings)

7. **aliases.zsh** — Aliases and shell functions (runs last, no dependencies).
   - File: `zsh/aliases.zsh`, `<tool>/aliases.zsh`
   - Examples: `golang/aliases.zsh`, `git/aliases.zsh`, `docker/aliases.zsh`

### Critical: zsh/ Runs First Within Each Phase

Within EACH phase, the shell's own files (`zsh/<phase>.zsh`) are sourced FIRST, before any tool directories. This is enforced in `_mn_load_phase()` with an explicit prefix test (not a negation glob), because the function must NOT set options like `local_options` — that would revert `setopts` inside `zsh/init.d/` on function return.

In particular, `zsh/path.zsh` resets and rebuilds `$path` from scratch, so it MUST run before any tool that appends/prepends entries. If a tool's `path.zsh` ran first, its contributions would be wiped by `zsh/path.zsh`.

## The Five Footguns

### 1. Wrong Phase Order: Tool path.zsh Before zsh/path.zsh

**Symptom:** Tool's bin directory missing from PATH entirely.

**Cause:** If a tool's `path.zsh` runs before `zsh/path.zsh`, the tool's contributions are silently wiped when `zsh/path.zsh` resets `$path`.

**Fix:** The phase loader guarantees `zsh/<phase>.zsh` runs first (see `.zshrc`, lines 62–68). Do not edit `_mn_load_phase()` or the phase loop order. When adding a tool, just create `<tool>/path.zsh` — the loader handles the order.

**Verification:** Check `.zshrc` lines 73–75 and 114–116. Pre-compinit phases run in order: `env`, `path`, `completions`. Post-compinit phases: `compdef`, `init`, `aliases`. zsh/ always runs first within each phase (lines 62–63).

---

### 2. Local typeset Inside Phase Function Silently Discards Tool Contributions

**Symptom:** PATH looks fine in the loader but becomes incomplete when the shell prompt appears.

**Cause:** A phase file (or any sourced file) runs inside `_mn_load_phase()`. If it uses a bare `typeset path=...` (without `-g`), it creates a function-local copy. When the function returns, all tool contributions to that local copy are lost.

**Example of the bug:**
```zsh
# WRONG: inside a phase file sourced by _mn_load_phase()
typeset path=(${HOME}/.local/bin ...)  # Creates function-local path
path+=("${TOOL_BIN}")                   # Appends to the local copy
# Function returns → local path discarded, tool contribution lost
```

**Fix:** Do NOT redeclare `typeset path`, `typeset PATH`, `typeset fpath`, `typeset FPATH`, `typeset manpath`, or `typeset MANPATH` inside phase files. These must be declared at GLOBAL scope in `.zshrc` (line 19) with the `-gU` flags set. Phase files add to these globals:
```zsh
# RIGHT: in a phase file
path=(${HOME}/.local/bin ...)  # Uses the global path declared in .zshrc
path+=("${TOOL_BIN}")           # Appends to the global path
```

**Verification:** Check `.zshrc` line 19:
```zsh
typeset -gU path PATH fpath FPATH manpath MANPATH
```
This declares the globals ONCE, at scope before any phase runs. Never redeclare them in phase files.

---

### 3. Phase-Sensitive Exports in path.zsh Instead of env.zsh

**Symptom:** Tool's PATH entry is empty or does not exist.

**Cause:** A tool needs an export (e.g. `$GOBIN`) to be set before its `path.zsh` uses it. If the export is placed in `path.zsh`, it's too late — `path.zsh` runs after `env.zsh`, but any export placed there might not be visible to other tool `path.zsh` files if they assume it was set earlier.

**Example (golang):**
- `golang/env.zsh` sets `$GOBIN` (runs in env phase, first)
- `golang/path.zsh` appends `$GOBIN` to `$path` (runs in path phase, after env)

If `$GOBIN` were set in `golang/path.zsh`, it would not be available to other tools in their `path.zsh` files, and the timing would be unclear.

**Fix:** Separate concerns by phase:
- `<tool>/env.zsh` — All exports needed by downstream phases
- `<tool>/path.zsh` — Use exports from `<tool>/env.zsh` (or `zsh/env.zsh`)

**Verification:** Check `golang/env.zsh` (sets `$GOBIN` export) and `golang/path.zsh` (uses `$GOBIN`). Confirm the env phase runs before path phase in `.zshrc` line 73.

---

### 4. zsh/init.d/ Numeric Prefixes and Direct Sourcing

**Symptom:** Shell options reset after sourcing; prompt shows wrong content.

**Cause:** `zsh/init.zsh` (which is sourced in the init phase) uses a loop to source `zsh/init.d/NN-*.zsh` fragments. These files run INSIDE the init phase's `_mn_load_phase()` call. If they relied on local options (like `local_options`), the `setopts` inside them would be reverted on function return.

To preserve option changes across the function boundary, `.zshrc` must NOT set `local_options` in `_mn_load_phase()` (see lines 54–58: this restriction is documented). Therefore, `zsh/init.d/` files are sourced from inside `zsh/init.zsh` (not from a separate phase function).

The numeric prefixes ensure order: `10-setopts.zsh` runs first (sets `extendedglob` and history options), then history/functions/extensions, then `50-prompt.zsh` last (depends on prior setup).

**Fix:**
- Create new init fragments in `zsh/init.d/NN-<name>.zsh` with a 10-unit gap (e.g., `NN = 10, 20, 30, ...`).
- Edit `zsh/init.zsh` only if you need to add static logic before or after the fragment loop.
- Do NOT edit `.zshrc` or `_mn_load_phase()`.

**Verification:** Check `zsh/init.zsh` lines 7–9 (loop over `zsh/init.d/*.zsh`). Confirm files exist: `zsh/init.d/10-setopts.zsh`, `20-history.zsh`, `30-functions.zsh`, `40-extensions.zsh`, `50-prompt.zsh`.

---

### 5. compinit Dump Caching: Keyed to ZSH_VERSION, Not Date

**Symptom:** Completions are stale after a zsh update; or the dump is rebuilt every login.

**Cause:** The dump filename includes `$ZSH_VERSION` (e.g., `zcompdump-5.9-1`) so different zsh versions do not share a cache. The cache is rebuilt only when:
1. The dump is missing, or
2. The dump is empty (`! -s ${zcompdump}`), or
3. The dump is older than 24 hours (`mtime > 24h`).

Between rebuilds, compinit uses the `-C` flag to skip security checks (fast path). After a rebuild, the dump is touched to reset the 24h mtime clock.

A compiled `.zwc` bytecode file is built in the background if missing or older than the dump itself — this never blocks the prompt.

**Fix:**
- If completions seem stale after a zsh update, check the dump path: `echo $XDG_CACHE_HOME/zsh/zcompdump-*`
- To force a rebuild, remove the dump: `rm -v ${XDG_CACHE_HOME}/zsh/zcompdump*` (or alias `dump_completions`)
- Do NOT manually edit the dump file.

**Verification:** Check `.zshrc` lines 91–102:
```zsh
zcompdump=${XDG_CACHE_HOME}/zsh/zcompdump-${ZSH_VERSION}
zcompdump_stale=(${zcompdump}(N.mh+24))
if ((${#zcompdump_stale})) || [[ ! -s ${zcompdump} ]]; then
  compinit -i -d ${zcompdump}
  touch ${zcompdump}
else
  compinit -C -d ${zcompdump}
fi
```
The `(N.mh+24)` glob qualifier matches files modified >24h ago; the `touch` resets the clock.

## Debugging Playbook

| Symptom | Likely Rule(s) | Diagnostic |
|---------|---|-----------|
| Tool's bin missing from PATH | 1, 2 | Run `echo $path` interactively; check if tool's `path.zsh` exists and uses globals not locals. |
| Tool's bin works in login shell but not in script | 2, 3 | Check if tool's `env.zsh` sets needed exports; verify `typeset -g` in `.zshrc`. |
| Completion silent / no suggestions | 5 | Check dump exists: `ls -la ${XDG_CACHE_HOME}/zsh/zcompdump-*` and rebuild if stale. Check `$fpath` has tool dirs: `echo $fpath`. |
| Completions wrong after zsh update | 5 | Dump filename changed (new `$ZSH_VERSION`). Rebuild: `rm ${XDG_CACHE_HOME}/zsh/zcompdump*`. |
| Shell option silently reverts after startup | 4 | Check option set in a phase file rather than `zsh/init.d/`. Move to `zsh/init.d/NN-*.zsh` and re-source. |
| Tool alias not found | (aliases phase) | Check `<tool>/aliases.zsh` exists; verify it's sourced after compdef (aliases phase runs last). |

## File Map

**zsh core phases:**
- `zsh/.zshrc` — Main entrypoint; defines phases and `_mn_load_phase()` loader
- `zsh/env.zsh` — Global exports (HISTFILE, BASE16_SHELL, etc.)
- `zsh/path.zsh` — Baseline PATH/MANPATH (resets $path from scratch, tool dirs layer on top)
- `zsh/completions.zsh` — fpath additions, zstyles, pre-compinit setup
- `zsh/compdef.zsh` — bashcompinit autoload
- `zsh/init.zsh` — Loop to source init.d/ fragments

**zsh init fragments (run in numeric order):**
- `zsh/init.d/10-setopts.zsh` — Shell options
- `zsh/init.d/20-history.zsh` — History configuration
- `zsh/init.d/30-functions.zsh` — Helper functions
- `zsh/init.d/40-extensions.zsh` — Extra widgets / keybinds
- `zsh/init.d/50-prompt.zsh` — Prompt setup (runs last)

**Per-tool phase files** (example: golang):
- `golang/env.zsh` — `$GOPATH`, `$GOBIN`, `$GOROOT` exports
- `golang/path.zsh` — Add `$GOBIN` to `$path`
- `golang/aliases.zsh` — golang aliases
- `golang/_go` — Completion function (autoloaded by compinit)

**Completion cache:**
- `$XDG_CACHE_HOME/zsh/zcompdump-${ZSH_VERSION}` — Compinit dump (keyed to zsh version)
- `$XDG_CACHE_HOME/zsh/zcompdump-${ZSH_VERSION}.zwc` — Compiled bytecode (background rebuild)

## Related

See the `add-tool` skill for step-by-step guidance on adding a new tool to this repo with proper phase-file structure.
