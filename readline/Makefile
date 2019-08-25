default: install

prepare:
	mkdir -p $(XDG_CONFIG_HOME)/readline

install: prepare
	@stow --verbose --restow --target $(XDG_CONFIG_HOME)/readline .

uninstall:
	@stow --verbose --delete --target $(XDG_CONFIG_HOME)/readline .

clean: uninstall
	rm -rf $(XDG_CONFIG_HOME)/readline

dry-run:
	@stow --verbose --simulate --target $(XDG_CONFIG_HOME)/readline .

.PHONY: default setup install uninstall clean dry-run

