include ../env.mk

install:
	ln -sf $(CURDIR) $(XDG_CONFIG_HOME)
	@npm i -g dockerfile-language-server-nodejs

clean:
	@npm uninstall -g dockerfile-language-server-nodejs
	rm -rf $(XDG_CONFIG_HOME)/docker

.PHONY: install clean
