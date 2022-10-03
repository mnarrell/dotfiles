include ../env.mk

install:
	@npm install -g @ansible/ansible-language-server
	@pip3 install -U -r $(CURDIR)/requirements.txt

clean:
	@pip3 uninstall -y -r $(CURDIR)/requirements.txt
	@npm uninstall -g @ansible/ansible-language-server

.PHONY: install clean
