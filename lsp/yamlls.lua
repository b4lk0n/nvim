local utils = require("utils")

return {
	cmd = {
		utils.get_lsp_path("yaml-language-server"),
		"--stdio",
	},
	filetypes = {
		"yaml",
	},
	root_markers = {
		".git",
	},
	settings = {
		yaml = {
			validate = true,
			hover = true,
			completion = true,
			schemaStore = {
				enable = true,
			},
		},
	},
}
