default: install

prepare:
	mkdir -p $(XDG_CONFIG_HOME)/tig
	mkdir -p $(XDG_DATA_HOME)/tig

install: prepare
	@stow --verbose --restow --target $(XDG_CONFIG_HOME)/tig .

uninstall:
	@stow --verbose --delete --target $(XDG_CONFIG_HOME)/tig .

clean: uninstall
	rm -rf $(XDG_CONFIG_HOME)/tig
	rm -rf $(XDG_DATA_HOME)/tig

dry-run:
	@stow --verbose --simulate --target $(XDG_CONFIG_HOME)/tig .

.PHONY: default setup install uninstall clean dry-run
