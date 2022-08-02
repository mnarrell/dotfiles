include ../env.mk

install: .ensure.xdg
	ln -sfn $(CURDIR) $(XDG_CONFIG_HOME)/direnv

clean:
	rm -rf $(XDG_CONFIG_HOME)/direnv

.PHONY: install clean
