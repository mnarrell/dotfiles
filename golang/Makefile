install:
	ln -sf $(CURDIR) $(XDG_CONFIG_HOME)/golang
	ln -sf $(CURDIR)/golangci.yml $(HOME)/.golangci.yml
	go get -u github.com/rakyll/hey
	go get -u honnef.co/go/tools/cmd/staticcheck

clean:
	rm -f $(HOME)/.golangci.yml
	rm -rf $(XDG_CONFIG_HOME)/golang

.PHONY: install clean
