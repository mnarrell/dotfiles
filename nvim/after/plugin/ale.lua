-- local g = vim.g

-- vim.cmd "highlight! link ALEErrorSign LspDiagnosticsSignError"

-- g.ale_echo_msg_error_str = "E"
-- g.ale_echo_msg_format = "[%linter%] %s [%severity%]"
-- g.ale_echo_msg_warning_str = "W"
-- g.ale_go_staticcheck_lint_package = 1
-- g.ale_lint_on_text_changed = "normal"
-- g.ale_sign_error = "✗"
-- -- g.ale_sign_error = '❌'
-- g.ale_sign_warning = "⚠"

-- g.ale_linters_explicit = true
-- g.ale_linters = {
-- 	hcl = { "terraform" },
-- 	go = { "staticcheck", "vet", "revive" },
-- 	markdown = { "alex", "markdownlint" },
-- 	yaml = { "yamllint" },
-- }

-- g.ale_fixers = {
-- 	bash = { "shfmt" },
-- 	hcl = { "terraform" },
-- 	html = { "prettier" },
-- 	markdown = { "prettier" },
-- 	sh = { "shfmt" },
-- 	yaml = { "prettier" },
-- 	python = { "isort", "yapf" },
-- }

-- require("mn.mappings").nnoremap("<Leader>at", ":ALEToggle<CR>")
