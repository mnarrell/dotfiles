include ../env.mk

install: .ensure.xdg
	@ln -sfn $(CURDIR) $(XDG_CONFIG_HOME)/alacritty
	# @git clone https://github.com/alacritty/alacritty.git $(HOME)/tmp/alacritty
	# @tic -xe alacritty,alacritty-direct $(HOME)/tmp/alacritty/extra/alacritty.info
	# @rm -rf $(HOME)/tmp/alacritty
	@defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO
	@defaults -currentHost write -globalDomain AppleFontSmoothing -int 2

clean:
	rm -rf $(XDG_CONFIG_HOME)/alacritty

.PHONY: install clean
