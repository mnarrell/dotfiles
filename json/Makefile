include ../env.mk

install:
	ln -sf $(CURDIR) $(XDG_CONFIG_HOME)/json
	@npm install -g jsonlint

clean:
	@npm uninstall -g jsonlint
	rm -rf $(XDG_CONFIG_HOME)/json

.PHONY: install clean
