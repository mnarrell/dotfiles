include ../env.mk

FZF_HOME := $(shell brew --prefix)

install:
	ln -sf $(CURDIR) $(XDG_CONFIG_HOME)
	$(FZF_HOME)/opt/fzf/install --all --xdg --no-update-rc

clean:
	rm -rf $(XDG_CONFIG_HOME)/fzf

.PHONY: install clean
