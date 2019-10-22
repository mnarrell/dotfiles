include ../env.mk

install: .ensure.xdg
	ln -sfn $(CURDIR) $(XDG_CONFIG_HOME)/gnu

clean:
	rm -rf $(XDG_CONFIG_HOME)/gnu

.PHONY: install clean
