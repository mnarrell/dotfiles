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
        ):
            return False

    if args[0] == "snip":
        args = args[1:]
        if not args:
            return False

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
        return args[1] == "--list" or args[1] in {"clean", "test", "build"}

    if args[0] == "go" and len(args) > 1:
        return args[1] in {"build", "test", "vet", "version"}

    if args[0] == "tofu" and len(args) > 1:
        if args[1] == "init":
            return not any(
                arg in {"-backend-config", "--backend-config"}
                or arg.startswith(("-backend-config=", "--backend-config="))
                or arg in {"-reconfigure", "--reconfigure", "-migrate-state", "--migrate-state"}
                for arg in args[2:]
            )
        if args[1] == "plan":
            return not any(arg == "-generate-config-out" or arg.startswith("-generate-config-out=") for arg in args[2:])
        return False

    # Only the unambiguous local rendering form is catalogued; do not match a
    # subcommand merely because one argument happens to contain "template".
    return args[0] == "helmfile" and len(args) > 1 and args[1] == "template"


try:
    payload = json.load(sys.stdin)
    command = payload["tool_input"]["command"]
except (KeyError, TypeError, json.JSONDecodeError):
    sys.exit(0)

if isinstance(command, str) and safe_command(command):
    subprocess.run(["snip", "hook"], input=json.dumps(payload), text=True, check=False)
