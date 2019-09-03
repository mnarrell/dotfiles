install:
	mkdir -p $(XDG_CONFIG_HOME)/python
	@stow --verbose --restow --target $(XDG_CONFIG_HOME)/python .
	@pip2 install -U -r $(CURDIR)/requirements.txt
	@pip3 install -U -r $(CURDIR)/requirements.txt

clean:
	@stow --verbose --delete --target $(XDG_CONFIG_HOME)/python .
	@pip2 uninstall -y -r $(CURDIR)/requirements.txt
	@pip3 uninstall -y -r $(CURDIR)/requirements.txt
	rm -rf $(XDG_CONFIG_HOME)/python

.PHONY: install clean
