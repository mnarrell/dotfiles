import type { Plugin } from "@opencode-ai/plugin"

const server: Plugin = async (input) => {
  const shell = input.$

  return {
    "tool.execute.before": async (toolInput, output) => {
      if (toolInput.tool === "edit" || toolInput.tool === "write") {
        try {
          const result = await shell`git branch --show-current`.quiet()
          const branch = result.text().trim()
          if (branch === "main") {
            throw new Error(
              "ENFORCE: Cannot edit files on main branch. " +
              "Create a worktree first: git worktree add ~/.worktrees/<repo>/<branch-name> -b <branch-name>"
            )
          }
        } catch (e) {
          if (e instanceof Error && e.message.startsWith("ENFORCE:")) throw e
          // If git command fails (e.g. not a git repo), allow the edit
        }
      }
    },
  }
}

export default {
  server,
} satisfies import("@opencode-ai/plugin").PluginModule
