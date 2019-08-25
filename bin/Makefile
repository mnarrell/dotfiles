default: install

install:
	@stow --verbose --restow --target $(HOME)/bin .

uninstall:
	@stow --verbose --delete --target $(HOME)/bin .

clean: uninstall

dry-run:
	@stow --verbose --simulate --target $(HOME) .

.PHONY: default install uninstall clean dry-run
