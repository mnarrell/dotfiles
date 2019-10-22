include ../env.mk

install: .ensure.xdg
	ln -sfn $(CURDIR) $(XDG_CONFIG_HOME)/json
	@npm install -g jsonlint

clean:
	@npm uninstall -g jsonlint
	rm -rf $(XDG_CONFIG_HOME)/json

.PHONY: install clean
