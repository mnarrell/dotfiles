install:
	ln -sf $(CURDIR) $(XDG_CONFIG_HOME)/git
	@pip2 install -U -r $(CURDIR)/requirements.txt
	@pip3 install -U -r $(CURDIR)/requirements.txt

clean:
	@pip2 uninstall -y -r $(CURDIR)/requirements.txt
	@pip3 uninstall -y -r $(CURDIR)/requirements.txt
	rm -rf $(XDG_CONFIG_HOME)/git

.PHONY: install clean
