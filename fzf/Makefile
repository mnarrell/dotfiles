include ../env.mk

FZF_HOME := $(shell brew --prefix)

install: .ensure.xdg
	ln -sfn $(CURDIR) $(XDG_CONFIG_HOME)/fzf
	$(FZF_HOME)/opt/fzf/install --all --xdg --no-update-rc

clean:
	rm -rf $(XDG_CONFIG_HOME)/fzf

.PHONY: install clean
