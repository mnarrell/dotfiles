check.scripts:
	@find . -type f \
		-regextype egrep -regex "(.*/*\.sh|.*/(pre-up|post-up|pre-down|post-down))" \
		-not -path '*base16-shell*' \
		-not -path '*tmux/tmux.symlink/plugins*' \
		-not -path '*plugged*' \
		-not -path '*tmp*' \
		-exec shellcheck {} +

check.vim:
	@find vim -type f \
		-name "*.vim" \
		-not -name "plug.vim" \
		-not -path '*tmp*' \
		-not -path '*plugged*' \
		-not -path '*spell*' \
		-exec vint -c -s {} +

.PHONY: check
check: check.scripts check.vim

.PHONY: deps
deps:
	@./bootstrap

.PHONY: install
install:
	@./install

.PHONY: uninstall
uninstall:
	@./uninstall

.PHONY: test
test:
	@./support/verify
