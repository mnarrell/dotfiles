install:
	mkdir -p $(XDG_CONFIG_HOME)/nvim
	mkdir -p $(XDG_DATA_HOME)/nvim/{backup,swap,undo}
	@$(CURDIR)/setup

clean:
	@$(CURDIR)/teardown
	rm -rf $(TARGET)

.PHONY: install clean
