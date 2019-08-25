default: install

prepare:
	mkdir -p $(XDG_CONFIG_HOME)/markdown

install: prepare
	ln -sf $(CURDIR)/markdownlintrc.json $(HOME)/.markdownlintrc
	@npm install -g \
		alex \
		markdown2confluence \
		markdownlint-cli

uninstall:
	rm $(HOME)/.markdownlintrc
	@npm uninstall -g \
		alex \
		markdown2confluence \
		markdownlint-cli

clean: uninstall
	rm -rf $(XDG_CONFIG_HOME)/markdown

dry-run:
	@stow --verbose --simulate --target $(XDG_CONFIG_HOME)/markdown .

.PHONY: default setup install uninstall clean dry-run
