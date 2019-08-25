MAKEFLAGS ?= '-j 4'
MODULES = ansible bash bin docker fzf gem git gnu golang homebrew \
					java json kubernetes less markdown node npm nvim psql \
					python readline ripgrep tig tmux vagrant yamllint yapf zsh

CLEAN := $(addsuffix .clean,$(MODULES))

$(MODULES):
	$(MAKE) -C $@

$(CLEAN):
	$(MAKE) -C $(basename $@) clean

all: $(MODULES)

clean.all: $(CLEAN)

.PHONY: $(MODULES) $(CLEAN) all clean.all
