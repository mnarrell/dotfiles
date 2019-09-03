install:
	mkdir -p $(XDG_CONFIG_HOME)/node
	mkdir -p $(XDG_DATA_HOME)/node
	@stow --verbose --restow --target $(XDG_CONFIG_HOME)/node .

clean:
	@stow --verbose --delete --target $(XDG_CONFIG_HOME)/node .
	rm -rf $(XDG_CONFIG_HOME)/node
	rm -rf $(XDG_DATA_HOME)/node

.PHONY: install clean
