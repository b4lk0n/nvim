local utils = require("utils")

return {
	cmd = {
		utils.get_lsp_path("taplo"),
		"lsp",
		"stdio",
	},
	filetypes = {
		"toml",
	},
	root_markers = {
		".taplo.toml",
		"taplo.toml",
		".git",
	},
}
