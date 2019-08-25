default: install

prepare:
	mkdir -p $(XDG_CONFIG_HOME)/yamllint

install: prepare
	@stow --verbose --restow --target $(XDG_CONFIG_HOME)/yamllint .
	@pip2 install -U -r $(CURDIR)/requirements.txt
	@pip3 install -U -r $(CURDIR)/requirements.txt

uninstall:
	@stow --verbose --delete --target $(XDG_CONFIG_HOME)/yamllint .
	@pip2 uninstall -y -r $(CURDIR)/requirements.txt
	@pip3 uninstall -y -r $(CURDIR)/requirements.txt

clean: uninstall
	rm -rf $(XDG_CONFIG_HOME)/yamllint

dry-run:
	@stow --verbose --simulate --target $(XDG_CONFIG_HOME)/yamllint .

.PHONY: default setup install uninstall clean dry-run

