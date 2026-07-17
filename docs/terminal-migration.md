# Migrating from Alacritty to Ghostty or WezTerm

Both Ghostty and WezTerm configurations in this repo are feature-complete
translations of the existing Alacritty setup:

- **Same color scheme** — Tomorrow Night, including all 22 palette entries
- **Same font** — MesloLGM Nerd Font Mono, 12pt
- **Same keybindings** — all `Cmd+key` shortcuts pass through the tmux prefix (`Ctrl+Space`)
- **Same shell** — `/opt/homebrew/bin/zsh --login`
- **Same scrollback** — 100,000 lines
- **Same left-Option-as-Alt** behavior

The switch is designed to be non-destructive: Alacritty is not removed,
and both new configs live alongside it until you're confident.

---

## Migrating to Ghostty

### 1. Install and link config

```bash
brew install --cask ghostty   # if not done via brew bundle
task ghostty:up               # symlinks ghostty/ → ~/.config/ghostty
```

### 2. Reload tmux terminal-overrides

The `tmux.conf` already includes:

```tmux
set -sa terminal-overrides ',xterm-ghostty:RGB'
```

Reload the running tmux session to pick it up:

```bash
tmux source-file "$XDG_CONFIG_HOME/tmux/tmux.conf"
```

Or use the in-session binding: `prefix + r`.

### 3. Verify true color inside tmux

Open Ghostty, start (or attach to) a tmux session, then run:

```bash
printf '\033[38;2;255;100;0mTRUECOLOR\033[0m\n'
```

The word `TRUECOLOR` should render in orange, not an approximated 256-color
shade. If it looks wrong, confirm `$TERM` is `tmux-256color` inside tmux and
`xterm-ghostty` outside it.

### 4. Notable differences from Alacritty

| Feature | Alacritty | Ghostty |
|---|---|---|
| Config file | `alacritty.toml` | `ghostty/config` (key = value) |
| Window decoration | `decorations = "buttonless"` | `macos-titlebar-style = hidden` |
| Dynamic padding | `dynamic_padding = true` | `window-padding-balance = true` |
| `$TERM` | `alacritty` | `xterm-ghostty` |
| Terminfo registration | manual `tic` (via `tmux:up`) | automatic via Homebrew cask |

**`Cmd+H` caveat:** macOS intercepts `Cmd+H` as "Hide app" at the system
level before Ghostty sees it. This is a macOS constraint, not a Ghostty one.
The tmux binding `prefix + h` (select pane left) is unaffected — only the
`Cmd+H` shortcut will not work. Use `prefix + h` directly, or remap to a
non-conflicting key.

---

## Migrating to WezTerm

### 1. Install, link config, and register terminfo

```bash
brew install --cask wezterm   # if not done via brew bundle
task wezterm:up               # symlinks wezterm/ → ~/.config/wezterm
                              # and runs tic on the bundled terminfo
```

The `tic` step registers WezTerm's terminfo so `$TERM=wezterm` resolves
correctly inside tmux. Verify it landed:

```bash
toe ~/.terminfo | grep wezterm
```

### 2. Reload tmux terminal-overrides

The `tmux.conf` already includes:

```tmux
set -sa terminal-overrides ',wezterm:RGB'
```

Reload the running tmux session:

```bash
tmux source-file "$XDG_CONFIG_HOME/tmux/tmux.conf"
```

Or use `prefix + r`.

### 3. Verify true color inside tmux

```bash
printf '\033[38;2;255;100;0mTRUECOLOR\033[0m\n'
```

Should render orange. Inside tmux, `$TERM` should be `tmux-256color`;
outside (in WezTerm directly), it should be `wezterm`.

### 4. Notable differences from Alacritty

| Feature | Alacritty | WezTerm |
|---|---|---|
| Config file | `alacritty.toml` | `wezterm/wezterm.lua` (Lua) |
| Window decoration | `decorations = "buttonless"` | `window_decorations = 'RESIZE'` |
| Dynamic padding | `dynamic_padding = true` | fixed `window_padding` (no equiv.) |
| Window position | `window.position` | not configurable via config file |
| `$TERM` | `alacritty` | `wezterm` |
| Terminfo registration | manual `tic` (via `tmux:up`) | manual `tic` (via `wezterm:up`) |

**`Cmd+H` caveat:** same as Ghostty above — macOS "Hide app" intercepts
`Cmd+H` before WezTerm. The tmux `prefix + h` binding is unaffected.

**Default keybinding conflicts:** WezTerm ships with its own `Cmd+T` (new tab),
`Cmd+1-9` (activate tab), etc. The bindings in `wezterm.lua` override those
defaults. If you notice any WezTerm-native shortcuts interfering, add them
to the `config.keys` table with `action = wezterm.action.DisableDefaultAssignment`.

---

## Reverting to Alacritty

Neither migration removes Alacritty. To return:

1. Quit Ghostty or WezTerm and reopen Alacritty.
2. That's it — the Alacritty config is untouched.

To unlink a new terminal's config:

```bash
task ghostty:down   # removes ~/.config/ghostty symlink
task wezterm:down   # removes ~/.config/wezterm symlink
```

---

## tmux terminal-overrides reference

All three terminals are covered in `tmux/tmux.conf`:

```tmux
set -sa terminal-overrides ',alacritty:RGB'
set -sa terminal-overrides ',xterm-ghostty:RGB'
set -sa terminal-overrides ',wezterm:RGB'
```

This enables 24-bit true color in tmux regardless of which terminal you are
using at any given time.
