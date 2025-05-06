local cmd = function(lhs, rhs, opts)
  opts = vim.tbl_extend("force", { bang = true }, opts or {})
  vim.api.nvim_create_user_command(lhs, rhs, opts)
end

local map = function(mode, lhs, rhs, opts)
  opts = opts or { silent = true }
  vim.keymap.set(mode, lhs, rhs, opts)
end

--------------------
-- Commands

cmd("Wq", "wq")
cmd("Wqa", "wqa")

cmd("GX", [[:silent !gitx]])
cmd("TIG", [[:tabnew | terminal tig -a]])

cmd("AsConfluence", require("mn.tools").as_confluence)
cmd("Base64Decode", require("mn.tools").decode_base64, { range = "%" })

-- Terminals bro
cmd("TS", [[split | term <args>]], { nargs = "*" })
cmd("TV", [[vsplit | term <args>]], { nargs = "*" })
cmd("TT", [[tabnew | term <args>]], { nargs = "*" })
cmd("ClearLoupe", function()
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Plug>(LoupeClearHighlight)", true, true, true), "n", false)
end)

--------------------
-- Normal

map("n", "Q", "<Nop>")

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")

map("n", "<Leader>o", vim.cmd.only)
map("n", "<Leader>q", vim.cmd.quit)
map("n", "<Leader>x", vim.cmd.xit)
map("n", "<Leader>v", vim.cmd.vsplit)
map("n", "<Leader>s", ":sp<CR>")
map("n", "<Leader>k", ":bd!<CR>")
map("n", "<Leader>w", SaveAndReload)

-- Make Y behave like C and D
map("n", "Y", "y$")

-- Split navigation
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")

-- Scroll the viewport faster
map("n", "<C-e>", "5<C-e>")
map("n", "<C-y>", "5<C-y>")

-- Force filetypes
map("n", "_ba", ":set filetype=bash<CR>")
map("n", "_co", ":set filetype=conf<CR>")
map("n", "_df", ":set filetype=Dockerfile<CR>")
map("n", "_hl", ":set filetype=helm<CR>")
map("n", "_js", ":set filetype=json<CR>")
map("n", "_lu", ":set filetype=lua<CR>")
map("n", "_md", ":set filetype=markdown<CR>")
map("n", "_py", ":set filetype=python<CR>")
map("n", "_sh", ":set filetype=sh<CR>")
map("n", "_tx", ":set filetype=text<CR>")
map("n", "_vi", ":set filetype=vim<CR>")
map("n", "_vd", ":set filetype=vimdoc<CR>")
map("n", "_xm", ":set filetype=xml<CR>")
map("n", "_ya", ":set filetype=yaml<CR>")
map("n", "_zs", ":set filetype=zsh<CR>")
map("n", "_an", ":set filetype=yaml.ansible<CR>")
map("n", "_ng", ":set filetype=nginx<CR>")

-- Navigate between tabpages
map("n", "[t", ":tabprevious<CR>")
map("n", "]t", ":tabnext<CR>")

-- This was a nightmeer
map("n", "k", [[(v:count > 5 ? "m'" . v:count : '') . 'k']], { silent = true, expr = true })
map("n", "j", [[(v:count > 5 ? "m'" . v:count : '') . 'j']], { silent = true, expr = true })

map({ "i", "n" }, "<esc>", function()
  if vim.opt.hlsearch:get() then
    vim.cmd.nohl()
    vim.cmd.ClearLoupe()
  end
  return "<esc>"
end, { expr = true })

map("n", "<Leader>t", ":tabnew<CR>")

map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

--------------------
-- Terminal

map("t", "<Esc>", [[<C-\><C-n>]])
map("t", "<Leader>q", [[<C-\><C-n> :bd!<CR>]])

--------------------
-- Insert

map("v", ".", ":normal .<CR>")
map("v", "Q", ":normal @q<CR>")
map("x", "<", "<gv")
map("x", ">", ">gv")
map("x", "=", ">gv")

-- Crude XML Tag completion
map("i", [[</]], [[</<C-x><C-o>]])

-- Line text objects
map("x", "il", "g_o^")
map("o", "il", ":normal vil<CR>")
map("x", "al", "$o0")
map("o", "al", ":normal val<CR>")

map("o", "b", "vb") -- Make the 'b' motion inclusive

map("n", "cm", "gc", { remap = true })
map("n", "cml", ":norm gcc<CR>")
map("n", "dcm", "dgc", { remap = true })
map("v", "cm", "gc", { remap = true })
