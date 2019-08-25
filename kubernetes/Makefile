default: install

prepare:
	mkdir -p $(XDG_CONFIG_HOME)/kubernetes

install: prepare
	@stow --verbose --restow --target $(XDG_CONFIG_HOME)/kubernetes .

uninstall:
	@stow --verbose --delete --target $(XDG_CONFIG_HOME)/kubernetes .

clean: uninstall
	rm -rf $(XDG_CONFIG_HOME)/kubernetes

dry-run:
	@stow --verbose --simulate --target $(XDG_CONFIG_HOME)/kubernetes .

.PHONY: default setup install uninstall clean dry-run
