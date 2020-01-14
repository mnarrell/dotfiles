include ../env.mk

KUBECTL_VERSION = 1.11.3
KUBECTL_URL = https://storage.googleapis.com/kubernetes-release/release/v$(KUBECTL_VERSION)/bin/darwin/amd64/kubectl
KUBECTL = kubectl-$(KUBECTL_VERSION)

install: .ensure.xdg $(HOME)/bin/$(KUBECTL)
	@ln -sfn $(CURDIR) $(XDG_CONFIG_HOME)/kubernetes

clean:
	rm -rf $(XDG_CONFIG_HOME)/kubernetes
	rm -rf $(HOME)/bin/kubectl

$(HOME)/bin/$(KUBECTL):
	@echo "Installing kubectl $(KUBECTL_VERSION)..."
	@curl $(KUBECTL_URL) -o $(HOME)/tmp/$(KUBECTL)
	@chmod +x $(HOME)/tmp/$(KUBECTL)
	@mv $(HOME)/tmp/$(KUBECTL) $(HOME)/bin/$(KUBECTL)
	ln -sfn $(HOME)/bin/$(KUBECTL) $(HOME)/bin/kubectl

.PHONY: install clean
