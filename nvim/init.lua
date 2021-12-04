if require "mn.bootstrap"() then
	os.exit()
end

vim.cmd [[ let g:bufExplorerDisableDefaultKeyMapping=1 ]]

require "mn.options"
require "mn.plugins"
require "mn.lsp"
