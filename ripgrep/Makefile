default: install

prepare:
	mkdir -p $(XDG_CONFIG_HOME)/ripgrep

install: prepare
	@stow --verbose --restow --target $(XDG_CONFIG_HOME)/ripgrep .

uninstall:
	@stow --verbose --delete --target $(XDG_CONFIG_HOME)/ripgrep .

clean: uninstall
	rm -rf $(XDG_CONFIG_HOME)/ripgrep

dry-run:
	@stow --verbose --simulate --target $(XDG_CONFIG_HOME)/ripgrep .

.PHONY: default setup install uninstall clean dry-run

