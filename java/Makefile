include ../env.mk

install: .ensure.xdg
	ln -sfn $(CURDIR) $(XDG_CONFIG_HOME)/java
	sudo ln -sfn /usr/local/opt/openjdk/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk.jdk

clean:
	rm -rf $(XDG_CONFIG_HOME)/java
	sudo rm /Library/Java/JavaVirtualMachines/openjdk.jdk

.PHONY: install clean
