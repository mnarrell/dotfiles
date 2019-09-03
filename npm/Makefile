install:
	mkdir -p $(XDG_CONFIG_HOME)/npm
	mkdir -p $(XDG_CACHE_HOME)/npm
	mkdir -p $(XDG_DATA_HOME)/npm
	mkdir -p $(XDG_RUNTIME_DIR)/npm
	@stow --verbose --restow --target $(XDG_CONFIG_HOME)/npm .

clean:
	@stow --verbose --delete --target $(XDG_CONFIG_HOME)/npm .
	rm -rf $(XDG_CONFIG_HOME)/npm
	rm -rf $(XDG_CACHE_HOME)/npm
	rm -rf $(XDG_DATA_HOME)/npm
	rm -rf $(XDG_RUNTIME_DIR)/npm

.PHONY: install clean
