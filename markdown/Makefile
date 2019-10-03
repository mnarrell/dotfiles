install:
	ln -sf $(CURDIR) $(XDG_CONFIG_HOME)/markdown
	ln -sf $(CURDIR)/markdownlintrc.json $(HOME)/.markdownlintrc
	@npm install -g \
		alex \
		markdown2confluence \
		markdownlint-cli

clean:
	rm -f $(HOME)/.markdownlintrc
	@npm uninstall -g \
		alex \
		markdown2confluence \
		markdownlint-cli
	rm -rf $(XDG_CONFIG_HOME)/markdown

.PHONY: install clean
