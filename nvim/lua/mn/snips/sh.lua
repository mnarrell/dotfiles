local ls = require "luasnip"

local s = ls.s
local i = ls.insert_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

return {
	s({ trig = "#!", name = "shebang" }, t "#!/usr/bin/env bash"),

	s({ trig = "safe", name = "euo pipefail" }, { t {
		"set -euo pipefail",
		"IFS=$'\n\t'",
	} }),

	s(
		{ trig = "if", name = "Conditional" },
		{ t "if [[ ", i(1, "condition"), t { " ]]; then", "	" }, i(0), t { "", "fi" } }
	),

	s({ trig = "elif", name = "else branch" }, { t "elif [[ ", i(1, "conditional"), t { " ]]l then", "	" }, i(0) }),

	s(
		{ trig = "fori", name = "For lop with index" },
		fmt(
			[[
				for (( {} = 0; {} < {}; {}++ )); do
					{}
				done
			]],
			{ i(2, "i"), rep(2), i(1, "count"), rep(2), i(0) }
		)
	),

	s(
		{ trig = "for", name = "For loop" },
		{ t "for ", i(1, "needle"), t " in ", i(2, "haystack"), t { " ; do", "	" }, i(0), t { "", "done" } }
	),

	s(
		{ trig = "func", name = "Function definition" },
		{ t "function ", i(1, "function_name"), t { "() {", "	" }, i(0, "#function_body"), t { "", "}" } }
	),
}
