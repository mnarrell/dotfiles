install:
	mkdir -p $(XDG_CONFIG_HOME)/tig
	mkdir -p $(XDG_DATA_HOME)/tig
	@stow --verbose --restow --target $(XDG_CONFIG_HOME)/tig .

clean:
	@stow --verbose --delete --target $(XDG_CONFIG_HOME)/tig .
	rm -rf $(XDG_CONFIG_HOME)/tig
	rm -rf $(XDG_DATA_HOME)/tig

.PHONY: install clean
