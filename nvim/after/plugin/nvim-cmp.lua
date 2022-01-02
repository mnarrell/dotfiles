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
				ultisnips = "[US]",
				nvim_lua = "[Lua]",
				path = "[Path]",
				buffer = "[Buffer]",
				emoji = "[Emoji]",
			},
		},
	},

	snippet = {
		expand = function(args)
			vim.fn["UltiSnips#Anon"](args.body)
		end,
	},

	completion = {
		keyword_length = 1,
		completeopt = "menu,noselect",
	},

	mapping = {
		["<C-X><C-O>"] = cmp.mapping.complete(),
	},

	documentation = {
		border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
	},

	sources = cmp.config.sources {
		{ name = "nvim_lsp" },
		{ name = "ultisnips" },
		{ name = "nvim_lua" },
		{ name = "path" },
		{ name = "buffer", keyword_length = 4 },
	},
}

-- local cmp = require('cmp')
-- cmp.setup {
--   completion = {
--     autocomplete = false, -- disable auto-completion.
--   },
-- }

-- _G.vimrc = _G.vimrc or {}
-- _G.vimrc.cmp = _G.vimrc.cmp or {}
-- _G.vimrc.cmp.lsp = function()
--   cmp.complete({
--     config = {
--       sources = {
--         { name = 'nvim_lsp' }
--       }
--     }
--   })
-- end
-- _G.vimrc.cmp.snippet = function()
--   cmp.complete({
--     config = {
--       sources = {
--         { name = 'vsnip' }
--       }
--     }
--   })
-- end

-- vim.cmd([[
--   inoremap <C-x><C-o> <Cmd>lua vimrc.cmp.lsp()<CR>
--   inoremap <C-x><C-s> <Cmd>lua vimrc.cmp.snippet()<CR>
-- ]])
