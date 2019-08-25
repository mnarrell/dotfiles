default: install

prepare:
	mkdir -p $(XDG_CONFIG_HOME)/nvim
	mkdir -p $(XDG_DATA_HOME)/nvim/{backup,swap,undo}

install: prepare
	@$(CURDIR)/setup

uninstall:
	@$(CURDIR)/teardown

clean: uninstall
	rm -rf $(TARGET)

dry-run:
	@stow --verbose --simulate --target $(XDG_CONFIG_HOME)/nvim .

.PHONY: default setup install uninstall clean dry-run
