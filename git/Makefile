include ../env.mk

install: .ensure.xdg
	ln -sfn $(CURDIR) $(XDG_CONFIG_HOME)/git
	@pip install -U --user -r $(CURDIR)/requirements.txt

clean:
	@pip uninstall -y -r $(CURDIR)/requirements.txt
	rm -rf $(XDG_CONFIG_HOME)/git

.PHONY: install clean
