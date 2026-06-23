#! /usr/bin/env zsh

# Interactive-shell setup (phase 5). Kept small: it just sources the ordered
# fragments in zsh/init.d/ so each concern (options, history, prompt, ...)
# stays in its own readable file. Numeric prefixes fix the order; the prompt
# runs last because it depends on options/zle widgets set up earlier.
for _init_fragment in ${XDG_CONFIG_HOME}/zsh/init.d/*.zsh(N); do
  source ${_init_fragment}
done
unset _init_fragment
