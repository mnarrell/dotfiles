default: install

prepare:
	mkdir -p $(XDG_CONFIG_HOME)/npm
	mkdir -p $(XDG_CACHE_HOME)/npm
	mkdir -p $(XDG_DATA_HOME)/npm
	mkdir -p $(XDG_RUNTIME_DIR)/npm

install: prepare
	@stow --verbose --restow --target $(XDG_CONFIG_HOME)/npm .

uninstall:
	@stow --verbose --delete --target $(XDG_CONFIG_HOME)/npm .

clean: uninstall
	rm -rf $(XDG_CONFIG_HOME)/npm
	rm -rf $(XDG_CACHE_HOME)/npm
	rm -rf $(XDG_DATA_HOME)/npm
	rm -rf $(XDG_RUNTIME_DIR)/npm

dry-run:
	@stow --verbose --simulate --target $(XDG_CONFIG_HOME)/npm .

.PHONY: default setup install uninstall clean dry-run
