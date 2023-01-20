MODULES = \
	alacritty ansible bash bin direnv docker fd fzf gem git gnu golang helm  \
	homebrew java kubernetes less markdown node npm nvim pip psql python \
	readline ripgrep terraform tig tmux vagrant yamllint yapf zsh

CLEAN := $(addsuffix .clean,$(MODULES))

all: $(MODULES) ## Make it all

$(MODULES):
	$(MAKE) -C $@

$(CLEAN):
	$(MAKE) -C $(basename $@) clean

clean.all: $(CLEAN)

.PHONY: $(MODULES) $(CLEAN) all clean.all
