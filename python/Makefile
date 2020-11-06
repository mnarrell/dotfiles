include ../env.mk

install: .ensure.xdg
	ln -sfn $(CURDIR) $(XDG_CONFIG_HOME)/python
	@pip install -U --user -r $(CURDIR)/requirements.txt
	ln -sf $(CURDIR)/pycodestyle.toml $(XDG_CONFIG_HOME)/pycodestyle

clean:
	@pip uninstall -y -r $(CURDIR)/requirements.txt
	rm -rf $(XDG_CONFIG_HOME)/python
	rm $(XDG_CONFIG_HOME)/pycodestyle

.PHONY: install clean
