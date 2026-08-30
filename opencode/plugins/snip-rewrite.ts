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

type ToolInput = { tool?: string };
type ToolOutput = { args?: { command?: unknown } };

/** Hook adapter kept separate so tests can exercise fail-open behavior. */
function rewriteBashToolArgs(input: ToolInput, output: ToolOutput): void {
  try {
    if (input.tool !== "bash" || typeof output.args?.command !== "string") return;
    output.args.command = rewriteCommand(output.args.command);
  } catch {
    // A hook must never interfere with OpenCode's normal execution path.
  }
}

const snipRewritePlugin = Object.assign(async () => ({
  "tool.execute.before": async (input: ToolInput, output: ToolOutput) => {
    rewriteBashToolArgs(input, output);
  },
}), { isEligibleSimpleCommand, rewriteBashToolArgs, rewriteCommand });

// OpenCode requires a function export; attach pure helpers to its default export
// so the auto-loader does not mistake them for independent plugins.
export default snipRewritePlugin;
