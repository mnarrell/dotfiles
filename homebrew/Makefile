install:
	mkdir -p $(XDG_CONFIG_HOME)/homebrew
	@stow --verbose --restow --target $(XDG_CONFIG_HOME)/homebrew .

clean:
	@stow --verbose --delete --target $(XDG_CONFIG_HOME)/homebrew .
	rm -rf $(XDG_CONFIG_HOME)/homebrew

.PHONY: install clean
