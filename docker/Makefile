default: install

prepare:
	mkdir -p $(XDG_CONFIG_HOME)/docker

install: prepare
	@stow --verbose --restow --target $(XDG_CONFIG_HOME)/docker .
	@npm i -g dockerfile-language-server-nodejs

uninstall:
	@stow --verbose --delete --target $(XDG_CONFIG_HOME)/docker .
	@npm uninstall -g dockerfile-language-server-nodejs

clean: uninstall
	rm -rf $(XDG_CONFIG_HOME)/docker

dry-run:
	@stow --verbose --simulate --target $(XDG_CONFIG_HOME)/docker .

.PHONY: default setup install uninstall clean dry-run
