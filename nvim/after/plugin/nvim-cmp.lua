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
				omni = "[omni]",
				tmux = "[tmux]",
				nvim_lsp_document_symbol = "[Syms]",
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

	mapping = cmp.mapping.preset.insert {
		["<C-X><C-O>"] = cmp.mapping.complete(),
	},

	sources = cmp.config.sources {
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "luasnip" },
		{ name = "nvim_lua" },
		{ name = "path" },
		{ name = "buffer", keyword_length = 4 },
		{ name = "omni" },
		{ name = "nvim_lsp_document_symbol" },
		{ name = "tmux", keyword_length = 4 },
	},
}
