install:
	mkdir -p $(XDG_CONFIG_HOME)/tmux
	@stow --verbose --restow --target $(XDG_CONFIG_HOME)/tmux .

clean:
	@stow --verbose --delete --target $(XDG_CONFIG_HOME)/tmux .
	rm -rf $(XDG_CONFIG_HOME)/tmux

.PHONY: install clean
