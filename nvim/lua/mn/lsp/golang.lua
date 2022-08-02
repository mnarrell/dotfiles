local support = require "mn.lsp.support"

-- function OrgImports(wait_ms)
-- 	local params = vim.lsp.util.make_range_params()
-- 	params.context = { only = { "source.organizeImports" } }
-- 	local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
-- 	for _, res in pairs(result or {}) do
-- 		for _, r in pairs(res.result or {}) do
-- 			if r.edit then
-- 				vim.lsp.util.apply_workspace_edit(r.edit, "UTF-8")
-- 			else
-- 				vim.lsp.buf.execute_command(r.command)
-- 			end
-- 		end
-- 	end
-- end

local M = {}

local config = {
	gofumpt = true, -- A stricter gofmt
	codelenses = {
		-- SEE: https://github.com/golang/tools/blob/master/gopls/doc/settings.md#code-lenses
		gc_details = true, -- Toggle the calculation of gc annotations
		generate = true, -- Runs go generate for a given directory
		regenerate_cgo = true, -- Regenerates cgo definitions
		test = true, -- Runs go test for a specific set of test or benchmark functions
		tidy = true, -- Runs go mod tidy for a module
		upgrade_dependency = true, -- Upgrades a dependency in the go.mod file for a module
		vendor = true, -- Runs go mod vendor for a module
	},
	usePlaceholders = true,
	completeUnimported = true,
	analyses = {
		-- fieldalignment = true, -- find structs that would use less memory if their fields were sorted
		nilness = true, -- check for redundant or impossible nil comparisons
		shadow = true, -- check for possible unintended shadowing of variables
		unusedparams = true, -- check for unused parameters of functions
		unusedwrite = true, -- checks for unused writes, an instances of writes to struct fields and arrays that are never read
		useany = true,
	},
	staticcheck = true,
	hints = {
		assignVariableTypes = true,
		compositeLiteralFields = true,
		compositeLiteralTypes = true,
		constantValues = true,
		functionTypeParameters = true,
		parameterNames = true,
		rangeVariableTypes = true,
	},
}

local ok, private = pcall(require, "mn.lsp.go_private")
if ok then
	config = vim.tbl_extend("force", config, private) or config
end

M.config = vim.tbl_extend("keep", support.base_config, {
	cmd = { "gopls", "--remote=auto" },
	settings = {
		gopls = config
	},
})

return M
