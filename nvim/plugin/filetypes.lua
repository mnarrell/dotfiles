vim.filetype.add {
	filename = {
		["staticcheck.conf"] = "toml",
	},
	pattern = {
		["Brewfile.*"] = "ruby",
		[".*/git/config.*"] = "gitconfig",
		[".*/%.kube/config"] = "yaml",
		[".*/templates/.*%.yaml"] = "helm",
	},
}
