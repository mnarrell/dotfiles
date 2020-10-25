include ../env.mk

install: .ensure.xdg
	ln -sfn $(CURDIR) $(XDG_CONFIG_HOME)/yamllint
	@pip3 install -U -r $(CURDIR)/requirements.txt

clean:
	@pip3 uninstall -y -r $(CURDIR)/requirements.txt
	rm -rf $(XDG_CONFIG_HOME)/yamllint

.PHONY: install clean
