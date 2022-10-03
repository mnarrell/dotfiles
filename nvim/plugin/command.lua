local cmd = function(lhs, rhs, opts)
	opts = vim.tbl_extend("force", { bang = true }, opts or {})
	vim.api.nvim_create_user_command(lhs, rhs, opts)
end

cmd("Wq", "wq")
cmd("Wqa", "wqa")

cmd("PS", "PackerSync")
cmd("GX", [[:silent !gitx]])
cmd("TIG", [[:tabnew | terminal tig -a]])
cmd("ClearRegisters", [[call functions#ClearRegisters()]])

cmd("AsConfluence", require("mn.convert").as_confluence)
cmd("Base64Decode", require("mn.convert").decode_base64, { range = "%" })

-- Terminals bro
cmd("TS", [[split | term <args>]], { nargs = "*" })
cmd("TV", [[vsplit | term <args>]], { nargs = "*" })
cmd("TT", [[tabnew | term <args>]], { nargs = "*" })
