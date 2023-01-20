include ../env.mk

install: .ensure.xdg
	ln -sfn $(CURDIR) $(XDG_CONFIG_HOME)/docker

clean:
	rm -rf $(XDG_CONFIG_HOME)/docker

.PHONY: install clean
