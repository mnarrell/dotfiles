include ../env.mk

install: .ensure.xdg
	ln -sfn $(CURDIR) $(XDG_CONFIG_HOME)/readline

clean:
	rm -rf $(XDG_CONFIG_HOME)/readline

.PHONY: install clean

