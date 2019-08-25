default: install

prepare:
	mkdir -p $(XDG_CONFIG_HOME)/psql
	mkdir -p $(XDG_CACHE_HOME)/psql

install: prepare
	@stow --verbose --restow --target $(XDG_CONFIG_HOME)/psql .

uninstall:
	@stow --verbose --delete --target $(XDG_CONFIG_HOME)/psql .

clean: uninstall
	rm -rf $(XDG_CONFIG_HOME)/psql
	rm -rf $(XDG_CACHE_HOME)/psql

dry-run:
	@stow --verbose --simulate --target $(XDG_CONFIG_HOME)/psql .

.PHONY: default setup install uninstall clean dry-run
