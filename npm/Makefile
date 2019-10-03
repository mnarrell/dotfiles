install:
	ln -sf $(CURDIR) $(XDG_CONFIG_HOME)/npm
	mkdir -p $(XDG_CACHE_HOME)/npm
	mkdir -p $(XDG_DATA_HOME)/npm
	mkdir -p $(XDG_RUNTIME_DIR)/npm

clean:
	rm -rf $(XDG_CONFIG_HOME)/npm
	rm -rf $(XDG_CACHE_HOME)/npm
	rm -rf $(XDG_DATA_HOME)/npm
	rm -rf $(XDG_RUNTIME_DIR)/npm

.PHONY: install clean
