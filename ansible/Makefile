include ../env.mk

install:
	@yarn global add ansible-language-server
	@pip3 install -U -r $(CURDIR)/requirements.txt

clean:
	@pip3 uninstall -y -r $(CURDIR)/requirements.txt
	@yarn global remove ansible-language-server

.PHONY: install clean
