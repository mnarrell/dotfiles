TARGET = $(XDG_CONFIG_HOME)/tmux

default: install

prepare:
	mkdir -p $(TARGET)

install: prepare
	@stow --verbose --restow --target $(TARGET) .

uninstall:
	@stow --verbose --delete --target $(TARGET) .

clean: uninstall
	rm -rf $(TARGET)

dry-run:
	@stow --verbose --simulate --target $(TARGET) .

.PHONY: default setup install uninstall clean dry-run
