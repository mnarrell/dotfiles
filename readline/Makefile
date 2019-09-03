install:
	mkdir -p $(XDG_CONFIG_HOME)/readline
	@stow --verbose --restow --target $(XDG_CONFIG_HOME)/readline .

clean:
	@stow --verbose --delete --target $(XDG_CONFIG_HOME)/readline .
	rm -rf $(XDG_CONFIG_HOME)/readline

.PHONY: install clean

