include ../env.mk

install:
	echo $(XDG_RUNTIME_DIR)
	ln -sf $(CURDIR)/.bash_profile $(HOME)/.bash_profile
	ln -sf $(CURDIR)/.bashrc $(HOME)/.bashrc

clean:
	rm -f $(HOME)/.bash_profile
	rm -f $(HOME)/.bashrc

.PHONY: install clean
