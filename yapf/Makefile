include ../env.mk

install: .ensure.xdg
	ln -sfn $(CURDIR) $(XDG_CONFIG_HOME)/yapf
	@pip3 install -U -r $(CURDIR)/requirements.txt

clean:
	@pip3 uninstall -y -r $(CURDIR)/requirements.txt
	rm -rf $(XDG_CONFIG_HOME)/yapf

.PHONY: install clean
