if not (pcall(require, "cmp") and pcall(require, "lspkind")) then
	return
end

local cmp = require "cmp"
cmp.setup {
	formatting = {
		format = require("lspkind").cmp_format {
			with_text = false,
			menu = {
				nvim_lsp = "[LSP]",
				luasnip = "[Snippet]",
				nvim_lua = "[Lua]",
				path = "[Path]",
				buffer = "[Buffer]",
				emoji = "[Emoji]",
			},
		},
	},

	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body)
		end,
	},

	completion = {
		keyword_length = 1,
		completeopt = "menu,noselect",
		-- autocomplete = false,
	},

	mapping = cmp.mapping.preset.insert({
		["<C-X><C-O>"] = cmp.mapping.complete(),
	}),

	sources = cmp.config.sources {
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "luasnip" },
		{ name = "nvim_lua" },
		{ name = "path" },
		{ name = "buffer", keyword_length = 4 },
	},
}

-- vim.cmd([[
--   inoremap <C-x><C-o> <Cmd>lua vimrc.cmp.lsp()<CR>
--   inoremap <C-x><C-s> <Cmd>lua vimrc.cmp.snippet()<CR>
-- ]])
