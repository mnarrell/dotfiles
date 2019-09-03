install:
	mkdir -p $(XDG_CONFIG_HOME)/golang
	@stow --verbose --restow --target $(XDG_CONFIG_HOME)/golang .
	ln -sf $(CURDIR)/golangci.yml $(HOME)/.golangci.yml
	go get -u github.com/rakyll/hey
	go get -u honnef.co/go/tools/cmd/staticcheck

clean:
	@stow --verbose --delete --target $(XDG_CONFIG_HOME)/golang .
	rm $(HOME)/.golangci.yml
	rm -rf $(XDG_CONFIG_HOME)/golang

.PHONY: install clean
