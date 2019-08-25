default: install

prepare:
	mkdir -p $(XDG_CONFIG_HOME)/json

install: prepare
	@stow --verbose --restow --target $(XDG_CONFIG_HOME)/json .
	@npm install -g jsonlint

uninstall:
	@stow --verbose --delete --target $(XDG_CONFIG_HOME)/json .
	@npm uninstall -g jsonlint

clean: uninstall
	rm -rf $(XDG_CONFIG_HOME)/json

dry-run:
	@stow --verbose --simulate --target $(XDG_CONFIG_HOME)/json .

.PHONY: default setup install uninstall clean dry-run
