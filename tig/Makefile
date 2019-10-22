include ../env.mk

install: .ensure.xdg
	ln -sfn $(CURDIR) $(XDG_CONFIG_HOME)/tig
	mkdir -p $(XDG_DATA_HOME)/tig

clean:
	rm -rf $(XDG_CONFIG_HOME)/tig
	rm -rf $(XDG_DATA_HOME)/tig

.PHONY: install clean
