install:
	mkdir -p $(XDG_CONFIG_HOME)/kubernetes
	@stow --verbose --restow --target $(XDG_CONFIG_HOME)/kubernetes .

clean:
	@stow --verbose --delete --target $(XDG_CONFIG_HOME)/kubernetes .
	rm -rf $(XDG_CONFIG_HOME)/kubernetes

.PHONY: install clean
