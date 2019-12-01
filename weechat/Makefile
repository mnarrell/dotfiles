include ../env.mk

install: .ensure.xdg
	ln -sfn $(CURDIR) $(XDG_CONFIG_HOME)/weechat

clean:
	rm -rf $(XDG_CONFIG_HOME)/weechat

.PHONY: install clean
