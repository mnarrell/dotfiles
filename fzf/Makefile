install:
	mkdir -p $(XDG_CONFIG_HOME)/fzf
	@stow --verbose --restow --target $(XDG_CONFIG_HOME)/fzf .

clean:
	@stow --verbose --delete --target $(XDG_CONFIG_HOME)/fzf .
	rm -rf $(XDG_CONFIG_HOME)/fzf

.PHONY: install clean
