local support = require "mn.lsp.support"

local M = {}

M.config = vim.tbl_extend("force", support.base_config, {
	on_attach = function(client, bufnr)
		if vim.bo[bufnr].buftype ~= "" or vim.bo[bufnr].filetype == "helm" then
			vim.notify("Helm is NOT yaml!", vim.log.levels.INFO)
			vim.diagnostic.disable(bufnr)
			vim.defer_fn(function()
				vim.diagnostic.reset(nil, bufnr)
			end, 1000)
			return
		end

		support.custom_attach(client, bufnr)
	end

})

return M
