include ../env.mk

GO_VERSION = 1.15.7
GO_URL = https://dl.google.com/go/go$(GO_VERSION).darwin-amd64.tar.gz

install: .ensure.xdg /usr/local/go-$(GO_VERSION)
	ln -sfn $(CURDIR) $(XDG_CONFIG_HOME)/golang
	ln -sfn $(CURDIR)/golangci.yml $(HOME)/.golangci.yml
	go get -u honnef.co/go/tools/cmd/staticcheck
	go get -u github.com/sbowman/xq


/usr/local/go-$(GO_VERSION):
	@echo "Installing Go $(GO_VERSION)"
	@curl $(GO_URL) | tar xz -C $(HOME)/tmp
	@sudo mv $(HOME)/tmp/go /usr/local/go-$(GO_VERSION)
	@sudo ln -sfn /usr/local/go-$(GO_VERSION) /usr/local/go

clean:
	rm -f $(HOME)/.golangci.yml
	rm -rf $(XDG_CONFIG_HOME)/golang

.PHONY: install clean
