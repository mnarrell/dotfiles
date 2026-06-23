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
the `default` task list (it is not automatic). For shell integration, drop phase-named files in the dir (see _ZSH init_
below) — no `.zshrc` edit needed.

## ZSH init (phase-based loader)

`.zshrc` is a small driver. Each tool dir under `$XDG_CONFIG_HOME` contributes to startup by dropping a file **named for
the phase** it belongs to; `.zshrc` sources every `<tool>/<phase>.zsh` one phase at a time. **Adding a tool needs no
`.zshrc` edit** — just drop the right-named file(s). Phases, in order:

| File              | Phase       | For                                                              |
| ----------------- | ----------- | ---------------------------------------------------------------- |
| `env.zsh`         | env         | exports only — **no PATH edits, no commands**                    |
| `path.zsh`        | path        | add to `$path` / `$manpath` / `$fpath`                           |
| `completions.zsh` | completions | `fpath` additions, `zstyle`, `autoload` (**pre**-`compinit`)     |
| _(compinit runs)_ |             |                                                                  |
| `compdef.zsh`     | compdef     | `compdef ...`, `source <(tool completion)` (**post**-`compinit`) |
| `init.zsh`        | init        | interactive setup: hooks, prompt, keybinds, `setopt`             |
| `aliases.zsh`     | aliases     | aliases and shell functions                                      |

Rules and gotchas:

- **`zsh/` is sourced first within every phase** (it lays down the baseline others layer onto). The critical case:
  `zsh/path.zsh` rebuilds `$path` from scratch, so it must run before any tool's `path.zsh` prepends/appends.
- **`typeset -gU path PATH fpath ... MANPATH` is declared in `.zshrc` at global scope** (note the `-g`). It must NOT be
  re-declared inside the loader or any phase file: a bare `typeset` there is function-local and silently discards every
  tool's PATH/fpath contribution. For the same reason the loader sets **no options** (`local_options`/`extendedglob`),
  since that would revert `setopt`s done by `zsh/init.d/`.
- **`path.zsh` order doesn't matter across tools**: anything order-sensitive lives in a different phase. GNU userland
  (`gnu/path.zsh`) and Go's bin (`golang/path.zsh`) **prepend** so they win over `/usr/bin`; appending would land them
  after it.
- **Put exports needed by later phases into `env.zsh`** (it runs first). E.g. `golang/env.zsh` resolves `$GOBIN`, which
  `golang/path.zsh` then puts on PATH.
- `zsh/`'s own interactive setup is split into `zsh/init.zsh` → `zsh/init.d/NN-*.zsh` (numeric-prefixed for order:
  setopts, history, functions, extensions, prompt). `zsh/init.zsh` just sources that dir.
- **compinit caching**: dump is `$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION`, rebuilt only when missing or >24h old, then
  compiled to `.zwc`. `dump_completions` (alias) wipes it.
- Secrets, machine-local, and work config live in a **sibling `~/.private_dotfiles/` repo, not here**, pulled in via
  symlinks (`zsh/local.zsh`, `git/config.local`, `git/config.work`) and a hardcoded `include` in `git/config`. These paths
  are gitignored; expect them to be absent on a fresh clone. `zsh/local.zsh` is sourced explicitly (first, before the
  phases) since it lives in another repo and does not follow the phase convention.

## Neovim (`nvim/` has its own toolchain)

- `task nvim:up` runs `uv sync --project nvim` (Python >=3.14, see `pyproject.toml`/`uv.lock`) plus npm/gem `neovim` providers.
- Plugins: lazy.nvim (`lazy-lock.json`) + Mason (`~/.local/share/nvim/mason/bin` is on PATH). Lockfiles are committed
  — keep them in sync.
- Lua is formatted with **stylua** (`nvim/stylua.toml`: 2-space, 120 col, sorted requires).
- LSP servers are configured one-per-file in `nvim/lsp/*.lua`; core Lua config is in `nvim/lua/`.

## Languages

Go tools are installed by `task go:up` (gofumpt, golangci-lint v2, staticcheck, govulncheck); their config lives in
`golang/` (`golangci.yml`, `revive.toml`).
