import { describe, expect, test } from "bun:test";

import snipRewrite from "../plugins/snip-rewrite";

const { isEligibleSimpleCommand, rewriteBashToolArgs, rewriteCommand } = snipRewrite;

describe("rewriteCommand", () => {
  test("prefixes simple commands once while preserving whitespace", () => {
    expect(rewriteCommand("echo hello")).toBe("snip echo hello");
    expect(rewriteCommand("  printf '%s' hello  ")).toBe("snip   printf '%s' hello  ");
    expect(rewriteCommand("snip git status")).toBe("snip git status");
  });

  test("accepts literal metacharacters inside balanced quotes", () => {
    expect(rewriteCommand("printf '%s' 'a|b && c; <d>'")).toBe(
      "snip printf '%s' 'a|b && c; <d>'",
    );
    expect(rewriteCommand('printf "%s" "a|b && c; <d>"')).toBe(
      'snip printf "%s" "a|b && c; <d>"',
    );
  });

  test("rejects operators, redirections, substitutions, and shell control syntax", () => {
    for (const command of [
      "echo a | cat", "echo a || cat", "echo a && cat", "echo a &", "echo a; cat",
      "echo a > out", "cat < in", "echo $(date)", "echo `date`", "echo $((1 + 1))",
      "echo ${HOME}", "echo \"$(date)\"", "echo \"${HOME}\"", "echo \"`date`\"",
      "(echo a)", "{ echo a; }", "if true; then echo a; fi",
      "echo a\necho b", "echo a\recho b",
    ]) {
      expect(rewriteCommand(command)).toBe(command);
    }
  });

  test("rejects malformed commands, environment assignments, and wrappers", () => {
    for (const command of [
      "", "   ", "echo 'unterminated", "echo trailing\\", "FOO=bar echo ok",
      "cd /tmp", "source file", ". file", "export X=1", "alias ll='ls'", "unset X",
      "set -e", "shopt -s nullglob", "eval echo", "exec echo", "command ls", "builtin echo",
      "env FOO=bar echo", "sh -c echo", "bash -c echo", "zsh -c echo", "sudo ls",
    ]) {
      expect(isEligibleSimpleCommand(command)).toBeFalse();
      expect(rewriteCommand(command)).toBe(command);
    }
  });

  test("rejects shell builtins and standalone control forms", () => {
    for (const command of [
      "! true", ":", "break", "continue", "declare variable", "exit", "false", "fc", "fg",
      "getopts optstring name", "hash command", "jobs", "let value=1", "local variable",
      "popd", "pushd", "read variable", "readonly variable", "return", "test -f file", "true",
      "trap handler EXIT", "type command", "typeset variable", "ulimit", "umask", "wait",
      "case word in", "elif true", "else", "[[ -f file ]]",
    ]) {
      expect(isEligibleSimpleCommand(command)).toBeFalse();
      expect(rewriteCommand(command)).toBe(command);
    }
  });
});

describe("rewriteBashToolArgs", () => {
  test("changes Bash only and fails open when mutation fails", () => {
    const bash = { args: { command: "git status" } };
    rewriteBashToolArgs({ tool: "bash" }, bash);
    expect(bash.args.command).toBe("snip git status");

    const other = { args: { command: "git status" } };
    rewriteBashToolArgs({ tool: "read" }, other);
    expect(other.args.command).toBe("git status");

    const frozen = Object.freeze({ args: Object.freeze({ command: "git status" }) });
    expect(() => rewriteBashToolArgs({ tool: "bash" }, frozen)).not.toThrow();
    expect(frozen.args.command).toBe("git status");
  });
});
