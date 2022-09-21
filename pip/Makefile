include ../env.mk

install: .ensure.xdg
	ln -sfn $(CURDIR) $(XDG_CONFIG_HOME)/pip

clean:
	rm -rf $(XDG_CONFIG_HOME)/pip

.PHONY: install clean
