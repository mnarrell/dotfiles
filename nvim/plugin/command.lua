vim.cmd [[command! PS PackerSync]]
vim.cmd [[command! GX :silent! !gitx]]
vim.cmd [[command! TIG :tabnew | terminal tig -a]]
vim.cmd [[command! ClearRegisters call functions#ClearRegisters()]]

vim.cmd [[command! -range=% AsConfluence :call functions#AsConfluence()]]
vim.cmd [[command! -range=% Base64Decode :call functions#Base64Decode()]]

vim.cmd [[command! Wq wq]]
vim.cmd [[command! Wqa wqa]]

-- Terminals bro
vim.cmd [[command! -nargs=* TS split | term <args>]]
vim.cmd [[command! -nargs=* TV vsplit | term <args>]]
vim.cmd [[command! -nargs=* TT tabnew | term <args>]]
