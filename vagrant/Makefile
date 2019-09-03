install:
	mkdir -p $(XDG_CONFIG_HOME)/vagrant
	mkdir -p $(XDG_DATA_HOME)/vagrant
	@stow --verbose --restow --target $(XDG_CONFIG_HOME)/vagrant .
	@vagrant plugin install vagrant-hosts

clean:
	@stow --verbose --delete --target $(XDG_CONFIG_HOME)/vagrant .
	rm -rf $(XDG_CONFIG_HOME)/vagrant
	rm -rf  $(XDG_DATA_HOME)/vagrant

.PHONY: install clean

