default: install

prepare:
	mkdir -p $(XDG_CONFIG_HOME)/gnu

install: prepare
	@stow --verbose --restow --target $(XDG_CONFIG_HOME)/gnu .

uninstall:
	@stow --verbose --delete --target $(XDG_CONFIG_HOME)/gnu .

clean: uninstall
	rm -rf $(XDG_CONFIG_HOME)/gnu

dry-run:
	@stow --verbose --simulate --target $(XDG_CONFIG_HOME)/gnu .

.PHONY: default setup install uninstall clean dry-run
