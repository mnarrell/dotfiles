include ../env.mk

install: .ensure.xdg
	ln -sfn $(CURDIR) $(XDG_CONFIG_HOME)/kubernetes

clean:
	rm -rf $(XDG_CONFIG_HOME)/kubernetes

.PHONY: install clean
