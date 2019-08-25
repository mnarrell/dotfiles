default: install

prepare:
	mkdir -p $(XDG_CONFIG_HOME)/fzf

install: prepare
	@stow --verbose --restow --target $(XDG_CONFIG_HOME)/fzf .

uninstall:
	@stow --verbose --delete --target $(XDG_CONFIG_HOME)/fzf .

clean: uninstall
	rm -rf $(XDG_CONFIG_HOME)/fzf

dry-run:
	@stow --verbose --simulate --target $(XDG_CONFIG_HOME)/fzf .

.PHONY: default setup install uninstall clean dry-run
