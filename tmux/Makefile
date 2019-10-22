include ../env.mk

install: .ensure.xdg
	ln -sfn $(CURDIR) $(XDG_CONFIG_HOME)/tmux

clean:
	rm -rf $(XDG_CONFIG_HOME)/tmux

.PHONY: install clean
