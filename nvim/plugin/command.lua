local command = require("mn.lib").command

command("Wq", "wq")
command("Wqa", "wqa")

command("PS", "PackerSync")
command("GX", [[:silent !gitx]])
command("TIG", [[:tabnew | terminal tig -a]])
command("ClearRegisters", [[call functions#ClearRegisters()]])

command("AsConfluence", [[:call functions#AsConfluence()]], { range = "%" })
command("Base64Decode", [[:call functions#Base64Decode()]], { range = "%" })

-- Terminals bro
command("TS", [[split | term <args>]], { nargs = "*" })
command("TV", [[vsplit | term <args>]], { nargs = "*" })
command("TT", [[tabnew | term <args>]], { nargs = "*" })
