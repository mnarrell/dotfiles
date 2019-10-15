include ../env.mk

install:
	ln -sf $(CURDIR) $(XDG_CONFIG_HOME)
	mkdir -p $(XDG_DATA_HOME)/tig

clean:
	rm -rf $(XDG_CONFIG_HOME)/tig
	rm -rf $(XDG_DATA_HOME)/tig

.PHONY: install clean
