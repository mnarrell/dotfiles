install:
	mkdir -p $(XDG_CONFIG_HOME)/less
	@stow --verbose --restow --target $(XDG_CONFIG_HOME)/less .

clean:
	@stow --verbose --delete --target $(XDG_CONFIG_HOME)/less .
	rm -rf $(XDG_CONFIG_HOME)/less

.PHONY: install clean
