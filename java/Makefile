install:
	mkdir -p $(XDG_CONFIG_HOME)/java
	@stow --verbose --restow --target $(XDG_CONFIG_HOME)/java .

clean:
	@stow --verbose --delete --target $(XDG_CONFIG_HOME)/java .
	rm -rf $(XDG_CONFIG_HOME)/java

.PHONY: install clean
