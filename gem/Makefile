default: install

prepare:
	mkdir -p $(XDG_CONFIG_HOME)/gem
	mkdir -p $(XDG_DATA_HOME)/gem
	mkdir -p $(XDG_CACHE_HOME)/gem

install: prepare
	@stow --verbose --restow --target $(XDG_CONFIG_HOME)/gem .

uninstall:
	@stow --verbose --delete --target $(XDG_CONFIG_HOME)/gem .

clean: uninstall
	rm -rf $(XDG_CONFIG_HOME)/gem
	rm -rf $(XDG_DATA_HOME)/gem
	rm -rf $(XDG_CACHE_HOME)/gem

dry-run:
	@stow --verbose --simulate --target $(XDG_CONFIG_HOME)/gem .

.PHONY: default setup install uninstall clean dry-run
