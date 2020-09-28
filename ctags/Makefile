include ../env.mk

install: .ensure.xdg
	ln -sfn $(CURDIR) $(XDG_CONFIG_HOME)/ctags

clean:
	rm -rf $(XDG_CONFIG_HOME)/ctags

.PHONY: install clean

