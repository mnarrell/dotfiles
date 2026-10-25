/** Conservative, quote-aware eligibility check for the local Snip rewrite hook. */
const INELIGIBLE_COMMANDS = new Set([
  "!",
  ".",
  ":",
  "[[",
  "alias",
  "bash",
  "break",
  "builtin",
  "case",
  "cd",
  "command",
  "coproc",
  "continue",
  "declare",
  "do",
  "done",
  "elif",
  "else",
  "env",
  "esac",
  "eval",
  "exec",
  "exit",
  "export",
  "false",
  "fc",
  "fi",
  "fg",
  "for",
  "function",
  "getopts",
  "hash",
  "jobs",
  "let",
  "local",
  "popd",
  "pushd",
  "read",
  "readonly",
  "return",
  "if",
  "in",
  "select",
  "set",
  "sh",
  "shift",
  "shopt",
  "source",
  "sudo",
  "test",
  "then",
  "time",
  "trap",
  "true",
  "type",
  "typeset",
  "ulimit",
  "umask",
  "unalias",
  "unset",
  "until",
  "wait",
  "while",
  "zsh",
]);

const LEADING_ASSIGNMENT = /^[A-Za-z_][A-Za-z0-9_]*=/;

/** Returns the original command unless it is an unambiguous simple Bash command. */
function rewriteCommand(command: string): string {
  if (!isEligibleSimpleCommand(command)) return command;
  return `snip ${command}`;
}

/** True only for nonempty, substitution-free, single simple commands. */
function isEligibleSimpleCommand(command: string): boolean {
  if (!command.trim() || /[\r\n]/.test(command)) return false;

  let quote: "single" | "double" | undefined;
  let escaped = false;
  let token = "";
  let firstToken: string | undefined;

  const finishToken = () => {
    if (token && firstToken === undefined) firstToken = token;
    token = "";
  };

  for (const character of command) {
    if (escaped) {
      token += character;
      escaped = false;
      continue;
    }

    if (quote === "single") {
      if (character === "'") quote = undefined;
      else token += character;
      continue;
    }
    if (quote === "double") {
      if (character === '"') quote = undefined;
      else if (character === "\\") escaped = true;
      else if (character === "$" || character === "`") return false;
      else token += character;
      continue;
    }

    if (character === "'") {
      quote = "single";
    } else if (character === '"') {
      quote = "double";
    } else if (character === "\\") {
      escaped = true;
    } else if (/\s/.test(character)) {
      finishToken();
    } else if ("|&;<>$`(){}".includes(character)) {
      return false;
    } else {
      token += character;
    }
  }

  if (quote || escaped) return false;
  finishToken();
  if (!firstToken || LEADING_ASSIGNMENT.test(firstToken)) return false;
  return firstToken !== "snip" && !INELIGIBLE_COMMANDS.has(firstToken);
}

type ToolExecuteBeforeEvent = {
  tool: string;
  input: unknown;
};

/** Candidate field names for the shell command inside a tool's `input`. The
 * exact v2 field name for the shell tool's input is not independently
 * confirmed beyond the v1 `command` convention, so each is checked
 * defensively; none matching is a safe no-op. */
const COMMAND_FIELDS = ["command", "cmd", "script"] as const;

/** Shell tool ids observed across v1 ("bash") and v2 (binary-confirmed
 * `opencode.tool.shell`, effective short id likely "shell"). Accept either
 * defensively. */
const SHELL_TOOL_IDS = new Set(["shell", "bash"]);

/** Hook adapter kept separate so tests can exercise fail-open behavior. */
function rewriteBashToolArgs(event: ToolExecuteBeforeEvent): void {
  try {
    if (!SHELL_TOOL_IDS.has(event.tool) || typeof event.input !== "object" || event.input === null) return;
    const input = event.input as Record<string, unknown>;
    for (const field of COMMAND_FIELDS) {
      if (typeof input[field] === "string") {
        input[field] = rewriteCommand(input[field] as string);
        return;
      }
    }
  } catch {
    // A hook must never interfere with OpenCode's normal execution path.
  }
}

type ToolDomain = {
  hook: (name: "execute.before", callback: (event: ToolExecuteBeforeEvent) => void | Promise<void>) => Promise<unknown>;
};

const snipRewritePlugin = {
  id: "snip-rewrite",
  setup: async (context: { tool: ToolDomain }) => {
    await context.tool.hook("execute.before", rewriteBashToolArgs);
  },
  // Exposed for tests; not part of the OpenCode plugin contract.
  isEligibleSimpleCommand,
  rewriteBashToolArgs,
  rewriteCommand,
};

export default snipRewritePlugin;
