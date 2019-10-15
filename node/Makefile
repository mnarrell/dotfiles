include ../env.mk

install:
	ln -sf $(CURDIR) $(XDG_CONFIG_HOME)
	mkdir -p $(XDG_DATA_HOME)/node

clean:
	rm -rf $(XDG_CONFIG_HOME)/node
	rm -rf $(XDG_DATA_HOME)/node

.PHONY: install clean
