install:
	mkdir -p $(XDG_CONFIG_HOME)/json
	@stow --verbose --restow --target $(XDG_CONFIG_HOME)/json .
	@npm install -g jsonlint

clean:
	@stow --verbose --delete --target $(XDG_CONFIG_HOME)/json .
	@npm uninstall -g jsonlint
	rm -rf $(XDG_CONFIG_HOME)/json

.PHONY: install clean
