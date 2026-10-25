## OpenCode

Shared harness rules load from `~/.agents/AGENTS.md` via `instructions` in `opencode.jsonc`.

- Delegate independent bounded work. Supervisors delegate multi-source or research-heavy web work to `researcher` with a narrow brief; direct research is only for an unavailable researcher or one small resource.
- In OpenCode, issue ordinary raw shell commands. The repo-local rewrite hook
  conservatively prefixes eligible simple Bash commands with `snip ` before
  native permission and external-directory evaluation. Compound or ambiguous
  commands stay raw in full. A manual `snip` prefix is not inherently trusted;
  it remains subject to command-specific permissions. Use `snip proxy -- <command>`
  only as the raw-output escape hatch. Restart OpenCode after changing this hook.
