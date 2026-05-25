local utils = require("utils")

return {
	cmd = {
		utils.get_lsp_path("biome"),
		"lsp-proxy",
	},
	filetypes = {
		"css",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"javascript",
		"javascriptreact",
		"json",
		"jsonc",
	},
	root_markers = {
		"biome.json",
	},
}
