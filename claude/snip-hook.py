#!/usr/bin/env python3
"""Only auto-approve snip rewrites for an explicit safe command catalog."""

import json
import shlex
import subprocess
import sys


def safe_command(command: str) -> bool:
    if any(token in command for token in ("&&", "||", ";", "|", ">", "<", "$", "`", "&", "\r", "\n")):
        return False

    try:
        args = shlex.split(command)
    except ValueError:
        return False

    if not args:
        return False

    # Do not let the snip hook become a shell or file-writing permission
    # boundary.  Native permission handling must see anything ambiguous.
    for index, arg in enumerate(args):
        if (
            arg == "-o"
            or arg.startswith("-o")
            or arg == "--output"
            or arg.startswith("--output=")
            or (index and args[index - 1] in {"-o", "--output"})
            or arg in {"-out", "--out"}
            or arg.startswith("-out=")
            or (index and args[index - 1] in {"-out", "--out"})
            or arg.startswith("-generate-config-out")
            or arg in {"--output-dir", "--write", "--fix"}
            or arg.startswith(("--output-dir=", "--write=", "--fix="))
        ):
            return False

    if args[0] == "snip":
        args = args[1:]
        if not args:
            return False

    if args[0] == "pwd":
        return len(args) == 1

    if args[0] == "date":
        return len(args) == 1

    if args[0] in {"ls", "rg", "wc", "tree", "stat", "diff", "cat", "head", "tail", "which", "grep", "cut"}:
        if args[0] == "rg" and any(
            arg == "--pre" or arg.startswith("--pre=") or arg == "--pre-glob" or arg.startswith("--pre-glob=")
            for arg in args[1:]
        ):
            return False
        return True

    if args[0] == "git" and len(args) > 1:
        if args[1] in {
            "status",
            "diff",
            "log",
            "show",
            "ls-remote",
            "merge-base",
            "rev-parse",
            "rev-list",
            "for-each-ref",
            "ls-files",
        }:
            return "-o" not in args and "--output" not in args and not any(arg.startswith("--output=") for arg in args)
        if args[1] == "branch":
            return (
                len(args) == 2
                or args[2] in {"-a", "--show-current", "--merged", "--no-merged"}
                or args[2].startswith("-v")
            )
        if args[1] == "worktree":
            return len(args) > 2 and args[2] == "list"
        if args[1] == "remote":
            return len(args) == 2 or args[2] == "-v"
        return args[1] == "config" and len(args) > 2 and args[2].startswith("--get")

    if args == ["mkdir", "-p", "/tmp/opencode"] or args == ["rm", "-rf", "/tmp/opencode"]:
        return True

    if args[0:2] == ["helm", "pull"]:
        return len(args) >= 5 and args[-2:] == ["--destination", "/tmp/opencode"]

    if args[0:3] in (["gh", "run", "download"], ["gh", "release", "download"]):
        return len(args) >= 5 and args[-2:] == ["--dir", "/tmp/opencode"]

    if args[0] == "gh" and len(args) > 1:
        readonly = {
            ("auth", "status"),
            ("issue", "list"),
            ("issue", "view"),
            ("label", "list"),
            ("pr", "checks"),
            ("pr", "diff"),
            ("pr", "list"),
            ("pr", "status"),
            ("pr", "view"),
            ("release", "list"),
            ("release", "view"),
            ("repo", "list"),
            ("repo", "view"),
            ("run", "list"),
            ("run", "view"),
            ("search",),
            ("workflow", "list"),
            ("workflow", "view"),
        }
        return tuple(args[1:3]) in readonly or (args[1],) in readonly

    if args[0] == "task" and len(args) > 1:
        return args[1:] in (
            ["--list"],
            ["clean"],
            ["test"],
            ["build"],
            ["lint"],
            ["check"],
            ["validate"],
            ["format"],
            ["clean", "test"],
            ["clean", "build"],
        )

    if args[0] in {"npm", "pnpm", "yarn", "bun"}:
        commands = {"test", "build", "lint", "check", "validate", "format", "typecheck"}
        return args[1:] == ["test"] or (len(args) == 3 and args[1] == "run" and args[2] in commands)

    if args[0] == "pytest":
        return True

    if args[0] in {"python", "python3"}:
        return len(args) >= 3 and args[1:3] == ["-m", "pytest"]

    if args[0] == "ruff":
        return len(args) > 1 and (args[1] == "check" or (args[1] == "format" and "--check" in args[2:]))

    if args[0] == "mypy":
        return len(args) > 1

    if args == ["go", "version"]:
        return True

    if args[0] == "helm" and len(args) > 1:
        return args[1] in {"template", "lint"} and not any(
            arg == "--post-renderer"
            or arg.startswith("--post-renderer=")
            or arg == "--post-renderer-args"
            or arg.startswith("--post-renderer-args=")
            for arg in args[2:]
        )

    if args[0] == "helmfile" and len(args) > 1:
        index = 1
        options_with_values = {"-e", "--environment", "-f", "--file", "-n", "--namespace", "-l", "--selector"}
        while index < len(args) and args[index].startswith("-"):
            if args[index] in options_with_values:
                index += 1
            index += 1
        return index < len(args) and args[index] in {"template", "lint"}

    if args[0] == "tofu" and len(args) > 1:
        if args[1:] in (
            ["init"],
            ["init", "-input=false"],
            ["plan"],
            ["plan", "-input=false"],
            ["plan", "-refresh=false"],
        ):
            return True
        if args[1] == "fmt":
            return len(args) > 2 and args[2] == "-check"
        if args[1] == "validate":
            return True
        return False

    if args[0] == "kubectl" and len(args) > 1:
        return args[1] in {
            "get",
            "describe",
            "logs",
            "top",
            "explain",
            "version",
            "cluster-info",
            "api-resources",
            "api-versions",
        }

    return False


if __name__ == "__main__":
    try:
        payload = json.load(sys.stdin)
        command = payload["tool_input"]["command"]
    except (KeyError, TypeError, json.JSONDecodeError):
        sys.exit(0)

    if isinstance(command, str) and safe_command(command):
        subprocess.run(["snip", "hook"], input=json.dumps(payload), text=True, check=False)
