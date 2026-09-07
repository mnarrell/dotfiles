#! /usr/bin/env zsh

# Agent Skills shared across harnesses. The skills live in agents/skills/; this
# links each one into every harness's skill directory:
#
#   ~/.claude/skills/<name>   Claude Code reads only this path
#   ~/.agents/skills/<name>   pi reads natively; OpenCode auto-scans it
#
# Per-skill links keep the destinations real directories, so skills from other
# sources sit alongside these. Only links pointing into this repo are ever
# created or removed.
#
#   link_skills            link current skills, prune stale ones
#   link_skills --unlink   remove this repo's links, leave the rest

typeset -g AGENT_SKILLS_DIR=${0:A:h}/skills

function link_skills() {
  local unlink_only=false
  case "${1:-}" in
    --unlink) unlink_only=true ;;
    "") ;;
    *)
      print -u2 "usage: link_skills [--unlink]"
      return 64
      ;;
  esac

  local src=$AGENT_SKILLS_DIR
  if [[ ! -d $src ]]; then
    print -u2 "link_skills: no skills directory at $src"
    return 1
  fi

  local dest link target skill name
  for dest in ~/.claude/skills ~/.agents/skills; do
    # A symlinked destination is the old whole-directory layout. Linking
    # through it would write links into whatever it points at, so replace it
    # with the real directory this expects.
    if [[ -L $dest ]]; then
      print "replacing symlinked $dest (was $(readlink $dest))"
      rm -f $dest
    fi

    # Prune ours: stale links always, all of them when unlinking. (N@) yields
    # only symlinks, and nothing at all when the directory is missing or empty.
    for link in $dest/*(N@); do
      target=$(readlink $link)
      [[ $target == $src/* ]] || continue # another source's skill; leave it
      if [[ $unlink_only == true || ! -e $target ]]; then
        rm -f $link
        print "unlinked ${link:t} ($dest)"
      fi
    done

    if [[ $unlink_only == true ]]; then
      continue
    fi

    mkdir -p $dest
    for skill in $src/*/SKILL.md(N); do
      name=${skill:h:t}
      link=$dest/$name
      if [[ -e $link && ! -L $link ]]; then
        print -u2 "link_skills: $link exists and is not a symlink; skipping"
        continue
      fi
      ln -sfn ${skill:h} $link
      print "linked $name -> ${skill:h} ($dest)"
    done
  done
}
