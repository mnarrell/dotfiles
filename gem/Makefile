install:
	mkdir -p $(XDG_CONFIG_HOME)/gem
	mkdir -p $(XDG_DATA_HOME)/gem
	mkdir -p $(XDG_CACHE_HOME)/gem
	@stow --verbose --restow --target $(XDG_CONFIG_HOME)/gem .

clean:
	@stow --verbose --delete --target $(XDG_CONFIG_HOME)/gem .
	rm -rf $(XDG_CONFIG_HOME)/gem
	rm -rf $(XDG_DATA_HOME)/gem
	rm -rf $(XDG_CACHE_HOME)/gem

.PHONY: install clean
