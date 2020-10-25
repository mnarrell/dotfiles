MODULES = \
	bash bin docker fzf gem git gnu golang helm homebrew java \
	kubernetes less markdown node npm nvim psql python \
	readline ripgrep tig tmux vagrant yamllint yapf zsh

CLEAN := $(addsuffix .clean,$(MODULES))

all: $(MODULES) ## Make it all

$(MODULES):
	$(MAKE) -C $@

$(CLEAN):
	$(MAKE) -C $(basename $@) clean

clean.all: $(CLEAN)

.PHONY: $(MODULES) $(CLEAN) all clean.all

help: ## Prints help for targets with comments
	@cat $(MAKEFILE_LIST) | grep -E '^[a-zA-Z_-]+:.*?## .*$$' | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
