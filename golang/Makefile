default: install

prepare:
	mkdir -p $(XDG_CONFIG_HOME)/golang

install: prepare
	@stow --verbose --restow --target $(XDG_CONFIG_HOME)/golang .
	ln -sf $(CURDIR)/golangci.yml $(HOME)/.golangci.yml
	go get -u github.com/rakyll/hey
	go get -u honnef.co/go/tools/cmd/staticcheck

uninstall:
	@stow --verbose --delete --target $(XDG_CONFIG_HOME)/golang .
	rm $(HOME)/.golangci.yml

clean: uninstall
	rm -rf $(XDG_CONFIG_HOME)/golang

dry-run:
	@stow --verbose --simulate --target $(XDG_CONFIG_HOME)/golang .

.PHONY: default setup install uninstall clean dry-run
