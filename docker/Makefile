install:
	mkdir -p $(XDG_CONFIG_HOME)/docker
	@stow --verbose --restow --target $(XDG_CONFIG_HOME)/docker .
	@npm i -g dockerfile-language-server-nodejs

clean:
	@stow --verbose --delete --target $(XDG_CONFIG_HOME)/docker .
	@npm uninstall -g dockerfile-language-server-nodejs
	rm -rf $(XDG_CONFIG_HOME)/docker
	@stow --verbose --simulate --target $(XDG_CONFIG_HOME)/docker .

.PHONY: install clean
