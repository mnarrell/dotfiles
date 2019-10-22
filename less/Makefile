include ../env.mk

install: .ensure.xdg
	ln -sfn $(CURDIR) $(XDG_CONFIG_HOME)/less

clean:
	rm -rf $(XDG_CONFIG_HOME)/less

.PHONY: install clean
