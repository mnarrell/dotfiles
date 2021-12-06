include ../env.mk

GO_VERSION = 1.17.3
GO_URL = https://dl.google.com/go/go$(GO_VERSION).darwin-amd64.tar.gz
# GO_URL = https://golang.org/dl/go$(GO_VERSION).darwin-amd64.tar.gz

install: .ensure.xdg /usr/local/go-$(GO_VERSION)
	ln -sfn $(CURDIR) $(XDG_CONFIG_HOME)/golang
	ln -sfn $(CURDIR)/golangci.yml $(HOME)/.golangci.yml
	go install honnef.co/go/tools/cmd/staticcheck@latest
	go install github.com/sbowman/xq@latest


/usr/local/go-$(GO_VERSION):
	@echo "Installing Go $(GO_VERSION)"
	@curl $(GO_URL) | tar xz -C $(HOME)/tmp
	@sudo mv $(HOME)/tmp/go /usr/local/go-$(GO_VERSION)
	@sudo ln -sfn /usr/local/go-$(GO_VERSION) /usr/local/go

clean:
	rm -f $(HOME)/.golangci.yml
	rm -rf $(XDG_CONFIG_HOME)/golang

.PHONY: install clean
