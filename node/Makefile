include ../env.mk

install: .ensure.xdg
	ln -sfn $(CURDIR) $(XDG_CONFIG_HOME)/node
	mkdir -p $(XDG_DATA_HOME)/node

clean:
	rm -rf $(XDG_CONFIG_HOME)/node
	rm -rf $(XDG_DATA_HOME)/node

.PHONY: install clean
