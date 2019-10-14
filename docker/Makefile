include ../env.mk

install:
	ln -sf $(PWD) $(XDG_CONFIG_HOME)/docker
	@npm i -g dockerfile-language-server-nodejs

clean:
	@npm uninstall -g dockerfile-language-server-nodejs
	rm -rf $(XDG_CONFIG_HOME)/docker

.PHONY: install clean
