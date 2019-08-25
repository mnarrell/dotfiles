default: install

prepare:
	mkdir -p $(XDG_CONFIG_HOME)/vagrant
	mkdir -p $(XDG_DATA_HOME)/vagrant

install: prepare
	@stow --verbose --restow --target $(XDG_CONFIG_HOME)/vagrant .
	@vagrant plugin install vagrant-hosts

uninstall:
	@stow --verbose --delete --target $(XDG_CONFIG_HOME)/vagrant .

clean: uninstall
	rm -rf $(XDG_CONFIG_HOME)/vagrant
	rm -rf  $(XDG_DATA_HOME)/vagrant

dry-run:
	@stow --verbose --simulate --target $(XDG_CONFIG_HOME)/vagrant .

.PHONY: default setup install uninstall clean dry-run

