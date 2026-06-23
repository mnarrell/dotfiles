# AGENTS.md

macOS dotfiles. Deployed with [`task`](https://taskfile.dev) (`Taskfile.yaml` is the source of truth) by symlinking
config dirs into XDG locations. No build, no tests, no CI.

## Commands

- `task` — deploy everything (the `default` task).
- `task <tool>:up` / `task <tool>:down` — link/unlink one tool (e.g. `task nvim:up`).
- `task --list` — see all tasks.
- `source ./bootstrap` — first-time only: sets XDG vars, inits git submodules, installs/updates Homebrew. Must be
  sourced, not executed.
- `brew bundle --file=Brewfile` — install packages. Brewfiles (`Brewfile`, `Brewfile.home`, `Brewfile.media`) are
  **manual**; no task applies them.

## How it works (read before editing)

Each `<tool>:up` does `ln -sfn {{.ROOT_DIR}}/<dir> $XDG_CONFIG_HOME/<dir>`. Once linked, **editing a file in this repo
changes the live config immediately** — there is no build step. XDG layout: config `~/.config`, data `~/.local/share`,
cache `~/.cache`, runtime `~/tmp/xdg_runtime`. ZSH runs with `ZDOTDIR=$XDG_CONFIG_HOME/zsh`.

To add a tool: create its dir, add `<tool>:up` and `<tool>:down` tasks in `Taskfile.yaml`, then append `<tool>:up` to
the `default` task list (it is not automatic).

## Gotchas

- `zsh/path.zsh` **unsets `$PATH` and rebuilds it from scratch** — order matters and mistakes break the shell.
- `.zshrc` source order: all `*/env.zsh` first -> `zsh/*.zsh` -> antidote plugins -> remaining `*/<name>.zsh`. Put
  exports needed early into a tool's `env.zsh`.
- Secrets, machine-local, and work config live in a **sibling `~/.private_dotfiles/` repo, not here**, pulled in via
  symlinks (`zsh/local.zsh`, `git/config.local`, `git/config.work`) and a hardcoded `include` in `git/config`. These paths
  are gitignored; expect them to be absent on a fresh clone.

## Neovim (`nvim/` has its own toolchain)

- `task nvim:up` runs `uv sync --project nvim` (Python >=3.14, see `pyproject.toml`/`uv.lock`) plus npm/gem `neovim` providers.
- Plugins: lazy.nvim (`lazy-lock.json`) + Mason (`~/.local/share/nvim/mason/bin` is on PATH). Lockfiles are committed
  — keep them in sync.
- Lua is formatted with **stylua** (`nvim/stylua.toml`: 2-space, 120 col, sorted requires).
- LSP servers are configured one-per-file in `nvim/lsp/*.lua`; core Lua config is in `nvim/lua/`.

## Languages

Go tools are installed by `task go:up` (gofumpt, golangci-lint v2, staticcheck, govulncheck); their config lives in
`golang/` (`golangci.yml`, `revive.toml`).
