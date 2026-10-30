# OS reinstall: Claude and OpenCode state

Date: 2026-10-30. Machine: `felix` (uses `Brewfile.home`).

How to carry Claude Code and OpenCode state across a wipe and clean macOS
install. Config itself lives in `dotfiles` and `private_dotfiles`, both clean
and pushed; this covers what lives outside them.

## What moves

| Item | Archived | Restored |
|---|---|---|
| `~/.claude` (memory, transcripts, history, plans, plugins) | yes | memory folders only |
| `~/Library/Application Support/Claude` (desktop app) | yes, minus the VM image and top-level caches | no |
| `~/.local/share/opencode`, `~/.local/state/opencode` | yes | `auth.json` only |
| `~/.ssh/config` (has drifted from the `private_dotfiles` copy) | yes | yes |
| `~/.kube/config` (differs from the `private_dotfiles` copy) | yes | yes |
| `~/.claude.json` | no: ephemeral app state | no |

Archived-but-not-restored items stay on the drive in case they are wanted
later. The restore relies on the same username (`matt`) and the same paths
(`~/.dotfiles`, `~/.private_dotfiles`, `~/src/homelab`): Claude names memory
folders after the project path.

The two config files are carried as-is because the live copies are the
current ones: `~/.ssh/config` has home hosts and a colima include the repo copy
lacks. Reconciling them with `private_dotfiles` is Phase 4 work.

## Phase 1: Back up (this machine)

Run these in Ghostty, not in a terminal inside Claude.app: step 2 quits it.

1. **Confirm all three repos are clean and pushed.** Each `status` must show
   `## main...origin/main` with no further lines, and each `log` must print
   nothing.

   ```bash
   git -C ~/.dotfiles status -sb
   ```

   ```bash
   git -C ~/.private_dotfiles status -sb
   ```

   ```bash
   git -C ~/src/opencode-config-work status -sb
   ```

   ```bash
   for r in ~/.dotfiles ~/.private_dotfiles ~/src/opencode-config-work; do git -C $r fetch -q && git -C $r log --oneline origin/main..HEAD; done
   ```

2. **Quit everything that writes this state.** Quit Claude.app (⌘Q), exit
   every `claude` and `opencode` session, and quit OpenCode.app. Then confirm
   nothing is left; this must print nothing.

   ```bash
   pgrep -lf -i 'claude|opencode'
   ```

   If anything is listed, quit it and run the check again. Stop the OpenCode
   background service if it is the only thing left:

   ```bash
   pkill -x opencode
   ```

3. **Plug in the external drive** and find its volume name.

   ```bash
   ls /Volumes
   ```

4. **Set the destination folder**, replacing `<Drive>` with that name.
   Everything goes in this one folder; nothing else on the drive is touched.
   This variable is used by every step below, so stay in the same terminal.

   ```bash
   export DEST="/Volumes/<Drive>/mac-migration-2026-10-30"
   ```

5. **Check there is room.** About 500 MB is needed.

   ```bash
   df -h "${DEST%/*}"
   ```

6. **Create the folder.**

   ```bash
   mkdir -p "$DEST"
   ```

7. **Archive Claude Code** (about 15 MB). Symlinks into the dotfiles are
   stored as symlinks.

   ```bash
   tar -czf "$DEST/claude-home.tgz" -C "$HOME" .claude
   ```

8. **Archive the Claude desktop app** (about 360 MB). This leaves out the
   12 GB VM image, which the app downloads again, and the top-level caches.

   ```bash
   tar -czf "$DEST/claude-desktop.tgz" -C "$HOME/Library/Application Support" --exclude 'Claude/vm_bundles' --exclude 'Claude/Cache' --exclude 'Claude/Code Cache' --exclude 'Claude/GPUCache' --exclude 'Claude/GPUPersistentCache' --exclude 'Claude/*DawnCache' --exclude 'Claude/DawnGraphiteCache' Claude
   ```

9. **Archive OpenCode** (about 70 MB; mostly `opencode.db`).

   ```bash
   tar -czf "$DEST/opencode.tgz" -C "$HOME/.local" share/opencode state/opencode
   ```

10. **Archive the SSH and Kubernetes configs** (a few KB). Only these two
    files: SSH keys live in 1Password, and `~/.kube/cache` is rebuilt.

    ```bash
    tar -czf "$DEST/machine-local.tgz" -C "$HOME" .ssh/config .kube/config
    ```

11. **Check the archives.**

    Memory: expect 15 lines (memory files plus their `MEMORY.md` indexes, as
    of 2026-10-30).

    ```bash
    tar -tzf "$DEST/claude-home.tgz" | grep '/memory/.*\.md$'
    ```

    Desktop app: expect `0` (the VM image was left out).

    ```bash
    tar -tzf "$DEST/claude-desktop.tgz" | grep -c vm_bundles
    ```

    OpenCode: expect exactly `share/opencode/auth.json`.

    ```bash
    tar -tzf "$DEST/opencode.tgz" | grep auth.json
    ```

    SSH and Kubernetes: expect `.ssh/config` and `.kube/config`.

    ```bash
    tar -tzf "$DEST/machine-local.tgz"
    ```

    Sizes: expect roughly 15 MB, 360 MB, 70 MB and a few KB.

    ```bash
    ls -lh "$DEST"
    ```

12. **Eject the drive.**

    ```bash
    diskutil eject "${DEST%/*}"
    ```

## Phase 2: Reinstall

1. **Wipe and install macOS** by your usual method.

2. **In Setup Assistant:**
   - At *Migration Assistant*, choose **Not Now**.
   - Create the account with account name **`matt`**, so the home folder is
     `/Users/matt`.
   - Sign in to your Apple Account.

3. **Check the home folder.** Open Terminal.app; this must print
   `/Users/matt`.

   ```bash
   echo $HOME
   ```

4. **Install the command-line tools** (git, make). Accept the dialog and wait
   for it to finish.

   ```bash
   xcode-select --install
   ```

5. **Install 1Password** from `1password.com/downloads/mac`, sign in, then
   turn on its SSH agent: *Settings → Developer → Use the SSH agent*. Your
   GitHub key lives there.

6. **Point SSH at the 1Password agent.** This minimal config is enough to
   clone; the full one comes later.

   ```bash
   mkdir -p ~/.ssh && chmod 700 ~/.ssh
   ```

   ```bash
   printf 'Host *\n  IdentityAgent "~/Library/Group Containers/2BUA8C4S2C.com.1password/t/agent.sock"\n' > ~/.ssh/config
   ```

7. **Check GitHub access.** Approve the 1Password prompt. Expect
   `Hi mnarrell! You've successfully authenticated`.

   ```bash
   ssh -T git@github.com
   ```

8. **Clone both repos.**

   ```bash
   git clone git@github.com:mnarrell/dotfiles.git ~/.dotfiles
   ```

   ```bash
   git clone git@github.com:mnarrell/private_dotfiles.git ~/.private_dotfiles
   ```

9. **Bootstrap.** This installs Homebrew and initialises submodules. When the
   Homebrew installer finishes, run the two `eval`/`echo` lines it prints so
   `brew` is on `PATH`.

   ```bash
   cd ~/.dotfiles && source bootstrap
   ```

10. **Install packages** (includes Claude.app, Claude Code, OpenCode, OpenCode
    Desktop, go-task, stow, gh, node).

    ```bash
    brew bundle --file=~/.dotfiles/Brewfile.home
    ```

11. **Deploy the dotfiles**, then OpenCode's config (not in the default run).

    ```bash
    cd ~/.dotfiles && task
    ```

    ```bash
    cd ~/.dotfiles && task opencode:up
    ```

12. **Deploy the private dotfiles.** These are the packages deployed on the old
    machine; `ssh`, `kube`, `comcast` and `terraform` were not.

    ```bash
    cd ~/.private_dotfiles && make git zsh bin spell nvim
    ```

13. **Start a fresh shell** so the new zsh config loads.

    ```bash
    exec zsh -l
    ```

14. **Finish the rest of the new-Mac setup**: tmux plugins, notification
    style, and the check, as in steps 6–8 of
    [agent-workflow.md](agent-workflow.md#setting-up-a-new-mac).

## Phase 3: Restore

1. **Sign in to Claude.** Open Claude.app and sign in. Then run the CLI once,
   complete its login, and exit with `/exit`.

   ```bash
   claude
   ```

2. **Plug in the drive and set the source folder**, replacing `<Drive>`.

   ```bash
   export DEST="/Volumes/<Drive>/mac-migration-2026-10-30"
   ```

3. **Unpack into a staging folder.**

   ```bash
   mkdir -p ~/restore
   ```

   ```bash
   tar -xzf "$DEST/claude-home.tgz" -C ~/restore
   ```

   ```bash
   tar -xzf "$DEST/opencode.tgz" -C ~/restore
   ```

   ```bash
   tar -xzf "$DEST/machine-local.tgz" -C ~/restore
   ```

4. **Copy the memory folders back.** The `opencode-config-work` memory folder
   is empty and is skipped.

   ```bash
   for p in -Users-matt--dotfiles -Users-matt-src-homelab; do mkdir -p ~/.claude/projects/$p && cp -R ~/restore/.claude/projects/$p/memory ~/.claude/projects/$p/; done
   ```

5. **Check the memory files arrived.** Expect 4 files, then 11.

   ```bash
   ls ~/.claude/projects/-Users-matt--dotfiles/memory
   ```

   ```bash
   ls ~/.claude/projects/-Users-matt-src-homelab/memory
   ```

6. **Copy OpenCode's provider credentials back.**

   ```bash
   mkdir -p ~/.local/share/opencode && cp ~/restore/share/opencode/auth.json ~/.local/share/opencode/ && chmod 600 ~/.local/share/opencode/auth.json
   ```

7. **Check OpenCode sees them.** Expect GitHub Copilot, OpenAI, OpenCode
   Console and OpenRouter, each `stored`.

   ```bash
   opencode auth list
   ```

8. **Restore the full SSH config**, replacing the minimal one from Phase 2.

   ```bash
   cp ~/restore/.ssh/config ~/.ssh/config && chmod 600 ~/.ssh/config
   ```

9. **Restore the Kubernetes config.**

   ```bash
   mkdir -p ~/.kube && cp ~/restore/.kube/config ~/.kube/config && chmod 600 ~/.kube/config
   ```

10. **Check SSH and Kubernetes.** The first must still print the GitHub
    greeting; the second must list your contexts.

    ```bash
    ssh -T git@github.com
    ```

    ```bash
    kubectl config get-contexts
    ```

11. **Check Claude recalls its memory.** Start a session in the dotfiles and
    ask "What's in your memory index?"; it should name the dictation-tool,
    agent-definitions and hands-on-testing memories.

    ```bash
    cd ~/.dotfiles && claude
    ```

12. **Remove the staging folder** once all checks pass. The drive copy
    remains.

    ```bash
    rm -rf ~/restore
    ```

13. **Eject the drive** and keep it until the new machine has been in use for
    a while.

    ```bash
    diskutil eject "${DEST%/*}"
    ```

## Phase 4: Afterwards (separate session)

Decided so far; each merge gets its own design pass before code changes.

1. **Make `dotfiles` private** (by hand). This must happen before step 2 is
   pushed. Either GitHub → `mnarrell/dotfiles` → *Settings → General → Danger
   Zone → Change visibility → Make private*, or:

   ```bash
   gh repo edit mnarrell/dotfiles --visibility private --accept-visibility-change-consequences
   ```

2. **Collapse `private_dotfiles` into `dotfiles`.**
   - Drop work config: `comcast/`, `git/config.work`, and anything
     employer-specific in `ssh`, `kube` and `terraform`.
   - Still to decide: where each stow package lands in the `task` layout, and
     whether the live `~/.ssh/config` and `~/.kube/config` replace the repo
     copies.

3. **Collapse `opencode-config-work` into the shared layout.**
   - Shared rules and skills go in `agents/`; OpenCode-only config in
     `opencode/`.
   - Its config wins, except model providers, which come from dotfiles
     translated to the v2 `providers` key (dotfiles still uses deprecated v1
     keys).
   - herdr stays out.
   - Still to decide: per-skill versions where they differ (`go`, `handoff`,
     `gh-cli`), and whether to keep the work-only skills (`git-tree`,
     `parsing-json`, `searching-files`) and the `permission-gate` plugin.

4. **Tidy up.** Update the new-Mac steps in `agent-workflow.md` to clone one
   repo, then archive `mnarrell/private_dotfiles` and
   `mnarrell/opencode-config-work` on GitHub.
