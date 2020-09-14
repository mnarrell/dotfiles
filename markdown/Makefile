include ../env.mk

install: .ensure.xdg
	ln -sfn $(CURDIR) $(XDG_CONFIG_HOME)/markdown
	@npm install -g \
		alex \
		markdown2confluence \

clean:
	@npm uninstall -g \
		alex \
		markdown2confluence \
	rm -rf $(XDG_CONFIG_HOME)/markdown

.PHONY: install clean
