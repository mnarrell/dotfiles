local echo = function(msg)
	vim.api.nvim_echo({ { msg, "Type" } }, true, {})
end

local download_packer = function()
	echo "Downloading packer.nvim..."
	local install_path = string.format("%s/site/pack/packer/start", vim.fn.stdpath "data")
	vim.fn.mkdir(install_path, "p")

	local out = vim.fn.system(
		string.format("git clone https://github.com/wbthomason/packer.nvim %s/packer.nvim", install_path)
	)

	echo(out)

	require "mn.plugins"

	vim.cmd [[
		PackerSync
		packadd packer.nvim
	]]
end

return function()
	if not pcall(require, "packer") then
		download_packer()
		return true
	end
	return false
end
