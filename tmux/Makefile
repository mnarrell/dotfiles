include ../env.mk

install: .ensure.xdg
	ln -sfn $(CURDIR) $(XDG_CONFIG_HOME)/tmux
	tic -xe tmux-256color $(CURDIR)/tmux-256color.src

clean:
	rm -rf $(XDG_CONFIG_HOME)/tmux
	rm -rf $(HOME)/.terminfo

.PHONY: install clean
