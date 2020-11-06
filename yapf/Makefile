include ../env.mk

install: .ensure.xdg
	ln -sfn $(CURDIR) $(XDG_CONFIG_HOME)/yapf
	@pip install -U --user -r $(CURDIR)/requirements.txt

clean:
	@pip uninstall -y -r $(CURDIR)/requirements.txt
	rm -rf $(XDG_CONFIG_HOME)/yapf

.PHONY: install clean
