default: install

install:
	@stow --verbose --restow --target $(HOME) .

uninstall:
	@stow --verbose --delete --target $(HOME) .

clean: uninstall

dry-run:
	@stow --verbose --simulate --target $(HOME) .

.PHONY: default install uninstall clean dry-run
