local ok, lspconfig = pcall(require, "lspconfig")
if not ok then
	vim.notify("Unable to load lspconfig", vim.log.levels.ERROR)
	return
end

local go_org_imports = function(wait_ms)
	local params = vim.lsp.util.make_range_params()
	params.context = { only = { "source.organizeImports" } }
	local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms)
	for cid, res in pairs(result or {}) do
		for _, r in pairs(res.result or {}) do
			if r.edit then
				local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
				vim.lsp.util.apply_workspace_edit(r.edit, enc)
			end
		end
	end
end

local on_attach = function(client, bufnr)
	print "gopls attached to dis"
	vim.api.nvim_buf_set_option(bufnr, "formatexpr", "")

	local autocmds = vim.api.nvim_create_augroup("golangAutocmds", { clear = true })
	vim.api.nvim_create_autocmd("BufWritePre", {
		callback = function(args)
			go_org_imports(1)
			-- vim.lsp.buf.format { async = true, bufnr = args.buf }
			vim.lsp.buf.format { bufnr = args.buf }
		end,
		group = autocmds,
		pattern = "*.go",
	})

	require("mn.lsp.support").on_attach(client, bufnr)
end

lspconfig.gopls.setup {
	on_attach = on_attach,
	capabilities = require("mn.lsp.support").capabilities(),
	flags = {
		debounce_text_changes = 500,
	},
	settings = {
		buildFlags = { "tools" },
		gopls = {
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
			diagnosticsDelay = "500ms",
		},
	},
}
