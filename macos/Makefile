include ../env.mk

install: .ensure.xdg
	sudo cp $(CURDIR)/limit.maxfiles.plist /Library/LaunchDaemons/limit.maxfiles.plist
	sudo cp $(CURDIR)/limit.maxproc.plist /Library/LaunchDaemons/limit.maxproc.plist

clean:
	sudo rm -f /Library/LaunchDaemons/limit.maxfiles.plist
	sudo rm -f /Library/LaunchDaemons/limit.maxproc.plist

.PHONY: install clean
