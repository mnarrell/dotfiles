include ../env.mk

install: .ensure.xdg
	ln -sfn $(CURDIR) $(XDG_CONFIG_HOME)/fd

clean:
	rm -rf $(XDG_CONFIG_HOME)/fd

.PHONY: install clean
