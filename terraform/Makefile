include ../env.mk

install: .ensure.xdg
	ln -sfn $(CURDIR) $(XDG_CONFIG_HOME)/terraform

clean:
	rm -rf $(XDG_CONFIG_HOME)/terraform

.PHONY: install clean

