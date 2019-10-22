include ../env.mk

install: .ensure.xdg
	ln -sfn $(CURDIR) $(XDG_CONFIG_HOME)/java

clean:
	rm -rf $(XDG_CONFIG_HOME)/java

.PHONY: install clean
