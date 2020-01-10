include ../env.mk

install: .ensure.xdg
	ln -sfn $(CURDIR) $(XDG_CONFIG_HOME)/helm

clean:
	rm -rf $(XDG_CONFIG_HOME)/helm

.PHONY: install clean
