install:
	mkdir -p $(XDG_CONFIG_HOME)/ripgrep
	@stow --verbose --restow --target $(XDG_CONFIG_HOME)/ripgrep .

clean:
	@stow --verbose --delete --target $(XDG_CONFIG_HOME)/ripgrep .
	rm -rf $(XDG_CONFIG_HOME)/ripgrep

.PHONY: install clean

