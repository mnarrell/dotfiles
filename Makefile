MODULES = \
	bash bin ctags docker fzf gem git gnu golang helm homebrew java \
	json kubernetes less markdown node npm nvim psql python \
	readline ripgrep tig tmux vagrant weechat yamllint yapf \
	zsh

CLEAN := $(addsuffix .clean,$(MODULES))

$(MODULES):
	$(MAKE) -C $@

$(CLEAN):
	$(MAKE) -C $(basename $@) clean

all: $(MODULES)

clean.all: $(CLEAN)

.PHONY: $(MODULES) $(CLEAN) all clean.all
