default: install

prepare:
	mkdir -p $(XDG_CONFIG_HOME)/node
	mkdir -p $(XDG_DATA_HOME)/node

install: prepare
	@stow --verbose --restow --target $(XDG_CONFIG_HOME)/node .

uninstall:
	@stow --verbose --delete --target $(XDG_CONFIG_HOME)/node .

clean: uninstall
	rm -rf $(XDG_CONFIG_HOME)/node
	rm -rf $(XDG_DATA_HOME)/node

dry-run:
	@stow --verbose --simulate --target $(XDG_CONFIG_HOME)/node .

.PHONY: default setup install uninstall clean dry-run
