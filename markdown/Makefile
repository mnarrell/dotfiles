include ../env.mk

install: .ensure.xdg
	ln -sfn $(CURDIR) $(XDG_CONFIG_HOME)/markdown
	ln -sf $(CURDIR)/markdownlintrc.json $(HOME)/.markdownlintrc
	@npm install -g \
		markdown2confluence

clean:
	rm -f $(HOME)/.markdownlintrc
	@npm uninstall -g \
		markdown2confluence
	rm -rf $(XDG_CONFIG_HOME)/markdown

.PHONY: install clean
