include ../env.mk

install: .ensure.xdg
	mkdir -p $(XDG_CONFIG_HOME)/docker/cli-plugins
	ln -sfn $(CURDIR) $(XDG_CONFIG_HOME)/docker
	ln -sfn /usr/local/opt/docker-buildx/bin/docker-buildx $(XDG_CONFIG_HOME)/docker/cli-plugins/docker-buildx

clean:
	rm -rf $(XDG_CONFIG_HOME)/docker

.PHONY: install clean
