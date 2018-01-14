SRC = $(shell find . -type f \
			-regextype egrep -regex "(.*/*\.sh|.*/(pre-up|post-up|pre-down|post-down))" \
			-not -path '*base16-shell*' \
			-not -path '*tpm*' \
			-not -path '*plugged*' \
			-not -path '*tmp*')

check.scripts: $(SRC)
	@shellcheck $^
