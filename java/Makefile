default: install

prepare:
	mkdir -p $(XDG_CONFIG_HOME)/java

install: prepare
	@stow --verbose --restow --target $(XDG_CONFIG_HOME)/java .

uninstall:
	@stow --verbose --delete --target $(XDG_CONFIG_HOME)/java .

clean: uninstall
	rm -rf $(XDG_CONFIG_HOME)/java

dry-run:
	@stow --verbose --simulate --target $(XDG_CONFIG_HOME)/java .

.PHONY: default setup install uninstall clean dry-run
