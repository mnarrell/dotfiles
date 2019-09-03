install:
	mkdir -p $(XDG_CONFIG_HOME)/psql
	mkdir -p $(XDG_CACHE_HOME)/psql
	@stow --verbose --restow --target $(XDG_CONFIG_HOME)/psql .

clean:
	@stow --verbose --delete --target $(XDG_CONFIG_HOME)/psql .
	rm -rf $(XDG_CONFIG_HOME)/psql
	rm -rf $(XDG_CACHE_HOME)/psql

.PHONY: install clean
