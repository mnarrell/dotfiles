default: install

prepare:
	mkdir -p $(XDG_CONFIG_HOME)/less

install: prepare
	@stow --verbose --restow --target $(XDG_CONFIG_HOME)/less .

uninstall:
	@stow --verbose --delete --target $(XDG_CONFIG_HOME)/less .

clean: uninstall
	rm -rf $(XDG_CONFIG_HOME)/less

dry-run:
	@stow --verbose --simulate --target $(XDG_CONFIG_HOME)/less .

.PHONY: default setup install uninstall clean dry-run
