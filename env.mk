XDG_CONFIG_HOME := ${HOME}/.config
XDG_CACHE_HOME := ${HOME}/.cache
XDG_DATA_HOME := ${HOME}/.local/share
XDG_RUNTIME_DIR := ${HOME}/tmp/xdg_runtime

.PHONY: .ensure.xdg
.ensure.xdg:
	mkdir -p $(XDG_CONFIG_HOME)
	mkdir -p $(XDG_CACHE_HOME)
	mkdir -p $(XDG_DATA_HOME)
	mkdir -p $(XDG_RUNTIME_DIR)
