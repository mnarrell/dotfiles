include ../env.mk

install:
	ln -sfn $(CURDIR)/.bash_profile $(HOME)/.bash_profile
	ln -sfn $(CURDIR)/.bashrc $(HOME)/.bashrc

clean:
	rm -f $(HOME)/.bash_profile
	rm -f $(HOME)/.bashrc

.PHONY: install clean
