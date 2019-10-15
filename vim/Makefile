include ../env.mk

install:
	ln -sf $(CURDIR) $(XDG_CONFIG_HOME)
	mkdir -p $(XDG_DATA_HOME)/vim/{backup,swap,undo}
	curl -sfLo "${XDG_CONFIG_HOME}/vim/autoload/plug.vim" --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim >> /dev/null

clean:
	rm -rf $(HOME)/.vimrc_background
	rm -rf $(PWD)/autoload/plug.vim
	rm -rf $(PWD)/plugged
	rm -rf $(XDG_CONFIG_HOME)/vim

.PHONY: install clean
