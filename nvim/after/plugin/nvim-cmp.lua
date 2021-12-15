if not (pcall(require, "cmp") and pcall(require, "lspkind")) then
	return
end

local cmp = require "cmp"
cmp.setup {
	formatting = {
		format = function(entry, item)
			item.kind = require("lspkind").presets.default[item.kind] .. " " .. item.kind
			item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				ultisnips = "[UltiSnips]",
				nvim_lua = "[Lua]",
				cmp_tabnine = "[TabNine]",
				look = "[Look]",
				path = "[Path]",
				spell = "[Spell]",
				calc = "[Calc]",
				emoji = "[Emoji]",
			})[entry.source.name]
			return item
		end,
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

	sources = {
		{ name = "nvim_lsp" },
		{ name = "ultisnips" },
		{ name = "nvim_lua" },
		{ name = "path" },
		{ name = "buffer", keyword_length = 4 },
	},
}
