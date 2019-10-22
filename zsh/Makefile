include ../env.mk

install:
	ln -sfn $(CURDIR) $(XDG_CONFIG_HOME)/zsh
	mkdir -p $(XDG_CACHE_HOME)/zsh
	mkdir -p $(XDG_DATA_HOME)/zsh
	@pip2 install -U -r $(CURDIR)/requirements.txt
	@pip3 install -U -r $(CURDIR)/requirements.txt
	antibody bundle < $(CURDIR)/bundle.txt > ${XDG_DATA_HOME}/zsh/plugins
	antibody update
	ln -sf $(CURDIR)/zshenv $(HOME)/.zshenv

clean:
	rm -f $(HOME)/.zshenv
	@pip2 uninstall -y -r $(CURDIR)/requirements.txt
	@pip3 uninstall -y -r $(CURDIR)/requirements.txt
	rm -rf $(XDG_CONFIG_HOME)/zsh
	rm -rf ${XDG_CACHE_HOME}/zsh

.PHONY: install clean
