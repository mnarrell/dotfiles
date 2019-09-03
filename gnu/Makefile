install:
	mkdir -p $(XDG_CONFIG_HOME)/gnu
	@stow --verbose --restow --target $(XDG_CONFIG_HOME)/gnu .

clean:
	@stow --verbose --delete --target $(XDG_CONFIG_HOME)/gnu .
	rm -rf $(XDG_CONFIG_HOME)/gnu

.PHONY: install clean
