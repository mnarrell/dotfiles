# AGENTS.md

macOS dotfiles deployed with `task` (Taskfile.yaml is source of truth). Symlinks config dirs into XDG locations;
changes to repo files take effect immediately—no build step.

## Key commands

```bash
task                  # Deploy all (default task)
task <tool>:up       # Link one tool (e.g., task nvim:up)
task --list          # Show all tasks
```

## Architecture

**Deployment:** `task <tool>:up` runs `ln -sfn $DOTFILES/<dir> $XDG_CONFIG_HOME/<dir>`. Edits take effect on next shell session.

**ZSH init (Taskfile.yaml defines order; phases source from `$XDG_CONFIG_HOME/*/<phase>.zsh`):**

- `env.zsh` — exports only (no PATH/commands)
- `path.zsh` — add to `$path`/`$manpath`/`$fpath`
- `completions.zsh` — fpath additions, zstyles, autoload (pre-compinit)
- _(compinit runs)_
- `compdef.zsh` — compdef, tool completions (post-compinit)
- `init.zsh` — hooks, prompt, keybinds, setopts
- `aliases.zsh` — aliases and functions

## ZSH phase rules

1. **`zsh/` sources first in every phase** — it resets `$path` from scratch. If a tool's `path.zsh` runs before `zsh/path.zsh`,
   its PATH contribution gets wiped out. `.zshrc` enforces this via explicit prefix test, not glob negation.

2. **Never re-declare `typeset -gU path PATH fpath MANPATH` in phase files** — at global scope in `.zshrc` only.
   A bare `typeset` in a phase function creates a local copy, silently discarding all tool contributions.

3. **Phase-sensitive exports:** `env.zsh` runs first. If a tool needs an export available to later phases (e.g.,
   `golang/env.zsh` sets `$GOBIN`, then `golang/path.zsh` uses it), put the export in `env.zsh`, not `path.zsh`.

4. **`zsh/init.d/` ordering:** Use numeric prefixes (`10-setopts.zsh`, `20-history.zsh`, etc.) for explicit init order.
   `.zshrc` sources these explicitly from `zsh/init.zsh` so setopt calls don't get reverted on function return.

5. **compinit caching:** Dump is `$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION`. Rebuilt only when missing/empty or >24h old
   (checked via mtime). Compiled to `.zwc` in background. The dump file name keys on `$ZSH_VERSION`, not date, so
   rebuilds are stable across days and don't require date commands.

## Adding a new tool

1. Create a directory in the repo root (e.g., `mytool/`).
2. Add phase files as needed: `env.zsh`, `path.zsh`, `completions.zsh`, etc.
3. Follow ZSH phase rules above (exports in `env.zsh`, PATH in `path.zsh`).
4. Add a `task mytool:up` target to `Taskfile.yaml` if it needs install steps beyond symlinking.
5. Test with `task mytool:up` and verify in a new shell session.

## Tool reference

### Neovim (`nvim/`)

- `task nvim:up` runs `uv sync --project nvim` (Python >=3.14) + npm/gem neovim providers
- Plugins managed by lazy.nvim; `lazy-lock.json` is committed
- Lua formatted with stylua (120 col, 2-space, sorted requires); config: `nvim/stylua.toml`
- LSPs one-per-file in `nvim/lsp/*.lua`; core config in `nvim/lua/`

### Go

- Tools installed by `task go:up` (gofumpt, golangci-lint v2, staticcheck, govulncheck)
- Config: `golang/golangci.yml`, `golang/revive.toml`; symlinked to `~/.golangci.yml`
