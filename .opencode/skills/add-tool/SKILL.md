---
name: add-tool
description: "Use when adding a new tool or config to this dotfiles repo — its directory, zsh phase files, and Taskfile up/down targets. Covers the symlink deploy pattern and verification."
---

## Procedure

1. **Create the tool directory in the repo root**

   ```bash
   mkdir <tool>
   ```

2. **Add phase files as needed**

   Create ZSH phase files in the tool directory for initialization. Common phases:
   - `env.zsh` — environment variable exports (runs first; no PATH/commands)
   - `path.zsh` — add to `$path`, `$manpath`, `$fpath`
   - `completions.zsh` — fpath additions, zstyles, autoload (pre-compinit)
   - `compdef.zsh` — compdef commands and tool completions (post-compinit)
   - `init.zsh` — hooks, prompt, keybinds, setopts
   - `aliases.zsh` — aliases and functions

   **Phase placement rules:** Load the `zsh-phases` skill for detailed ordering and constraints (e.g., exports in `env.zsh` must run before `path.zsh` if the path uses those exports; never re-declare `typeset -gU path` in phase functions).

3. **Add Taskfile.yaml targets**

   Add `<tool>:up` and `<tool>:down` targets to `Taskfile.yaml`. Template variable names:
   - `{{.ROOT_DIR}}` — repo root
   - `{{.XDG_CONFIG_HOME}}` — `~/.config` (or `$XDG_CONFIG_HOME` if set)

   **Example template:**
   ```yaml
   <tool>:up:
     desc: Configures <tool>
     cmds:
       - ln -sfn {{.ROOT_DIR}}/<tool> {{.XDG_CONFIG_HOME}}/<tool>
       # + any install/build steps (go install, cargo install, uv sync, brew, script), as needed

   <tool>:down:
     desc: Removes <tool> configuration
     cmds:
       - rm -rf {{.XDG_CONFIG_HOME}}/<tool>
   ```

   Use `ln -sfn` (symlink with force-update, no-dereference) for config directories. Distinguish immediate config symlinks from one-time install/build steps in separate cmds.

4. **Wire into the aggregate deploy task**

   If the tool should deploy by default (most do), add `task: <tool>:up` to the `default` task's `cmds` list in `Taskfile.yaml` (around line 505). Maintain alphabetical order.

   ```yaml
   default:
     desc: "Deploy all configuration"
     cmds:
       - task: ensure_xdg
       # ... existing tools ...
       - task: <tool>:up   # Add here in alphabetical order
   ```

5. **Verify**

   Test the up target:
   ```bash
   task <tool>:up
   ```

   Confirm the symlink:
   ```bash
   ls -L {{.XDG_CONFIG_HOME}}/<tool>
   ```

   Open a new shell session and verify phase initialization works (`echo $MANPATH` for path changes, verify aliases are available, etc.).

## Conventions

- **Up/down symmetry:** Every install/config in `:up` has a corresponding removal in `:down`.
- **Template variables:** Always use `{{.ROOT_DIR}}` and `{{.XDG_CONFIG_HOME}}`; never hardcode paths.
- **Symlink pattern:** `ln -sfn` for config directories ensures updates to repo files take effect immediately on next shell session.
- **Install steps:** One-time steps (go install, uv sync, cargo build) run during `:up`; config symlinks remain idempotent.
- **Phase file order matters:** Follow rules enforced by ZSH initialization; `zsh/` sources first in every phase to reset `$path` from scratch.

## Reference Implementations

**Golang** (`golang/`)
- Phase files: `env.zsh` (sets `$GOPATH`, `$GOBIN`, `$GOROOT`), `path.zsh` (adds `$GOBIN` to `$path`), `aliases.zsh` (lint alias)
- Taskfile: Symlinks config + runs multiple `go install` commands for tools (staticcheck, goimports, gofumpt, golangci-lint, govulncheck)
- Also symlinks `golangci.yml` to `~/.golangci.yml` for tool discovery

**Alacritty** (`alacritty/`)
- No phase files (terminal emulator; sourced into macOS defaults, not ZSH)
- Taskfile: Runs `alacritty/install` script (downloads + installs from GitHub release), symlinks config, installs terminfo entries to `~/.terminfo`
- Demonstrates one-time install steps + config symlink + platform-specific setup (terminfo, macOS font rendering defaults)

**ASDF** (`asdf/`)
- Simple: Symlinks config, generates ZSH completions on `:up` (with `ignore_error: true` for graceful failure)
- Phase files: Not always needed if the tool doesn't contribute to PATH or exports

Choose based on tool type:
- **Config only:** Simple symlink + maybe phase files
- **Build/install:** Symlink + install steps (go install, cargo, uv, brew, custom script)
- **Terminal/platform:** Install script + config symlink + platform setup (terminfo, macOS defaults)
