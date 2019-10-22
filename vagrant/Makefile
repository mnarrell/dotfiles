include ../env.mk

install: .ensure.xdg
	ln -sfn $(CURDIR) $(XDG_CONFIG_HOME)/vagrant
	mkdir -p $(XDG_DATA_HOME)/vagrant
	@vagrant plugin install vagrant-hosts

clean:
	rm -rf $(XDG_CONFIG_HOME)/vagrant
	rm -rf $(XDG_DATA_HOME)/vagrant

.PHONY: install clean

