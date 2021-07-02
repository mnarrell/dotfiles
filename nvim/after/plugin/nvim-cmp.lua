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
		-- autocomplete = false,
		autocomplete = true,
	},

	mapping = {
		["<C-X><C-O>"] = cmp.mapping.complete(),
		-- ["<C-p>"] = cmp.mapping.select_prev_item(),
		-- ["<C-n>"] = cmp.mapping.select_next_item(),
		-- ["<C-d>"] = cmp.mapping.scroll_docs(-4),
		-- ["<C-f>"] = cmp.mapping.scroll_docs(4),
		-- ["<C-Space>"] = cmp.mapping.complete(),
		-- ["<C-e>"] = cmp.mapping.close(),
		-- ["<CR>"] = cmp.mapping.confirm {
		-- 	behavior = cmp.ConfirmBehavior.Replace,
		-- 	select = true,
		-- },
	},

	documentation = {
		border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
	},

	sources = {
		{ name = "nvim_lsp" },
		{ name = "ultisnips" },
	},
}
