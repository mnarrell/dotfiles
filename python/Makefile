include ../env.mk

install: .ensure.xdg
	ln -sfn $(CURDIR) $(XDG_CONFIG_HOME)/python
	@pip3 install -U -r $(CURDIR)/requirements.txt
	ln -sf $(CURDIR)/flake8.toml $(XDG_CONFIG_HOME)/flake8
	@npm install -g pyright

clean:
	@pip3 uninstall -y -r $(CURDIR)/requirements.txt
	rm -rf $(XDG_CONFIG_HOME)/python
	rm $(XDG_CONFIG_HOME)/flake8
	@npm uninstall -g pyright

.PHONY: install clean
