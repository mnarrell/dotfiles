include ../env.mk

install:
	ln -sf $(CURDIR) $(XDG_CONFIG_HOME)/psql
	mkdir -p $(XDG_CACHE_HOME)/psql

clean:
	rm -rf $(XDG_CONFIG_HOME)/psql
	rm -rf $(XDG_CACHE_HOME)/psql

.PHONY: install clean
