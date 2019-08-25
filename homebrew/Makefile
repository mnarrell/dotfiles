default: install

prepare:
	mkdir -p $(XDG_CONFIG_HOME)/homebrew

install: prepare
	@stow --verbose --restow --target $(XDG_CONFIG_HOME)/homebrew .

uninstall:
	@stow --verbose --delete --target $(XDG_CONFIG_HOME)/homebrew .

clean: uninstall
	rm -rf $(XDG_CONFIG_HOME)/homebrew

dry-run:
	@stow --verbose --simulate --target $(XDG_CONFIG_HOME)/homebrew .

.PHONY: default setup install uninstall clean dry-run
