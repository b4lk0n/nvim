local utils = require("utils")

return {
	cmd = {
		utils.get_lsp_path("bash-language-server"),
		"start",
	},
	filetypes = {
		"sh",
		"bash",
	},
	root_markers = {
		".git",
	},
}
