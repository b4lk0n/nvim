local utils = require("utils")

return {
	cmd = {
		utils.get_lsp_path("vscode-json-language-server"),
		"--stdio",
	},
	filetypes = {
		"json",
		"jsonc",
	},
	root_markers = {
		".git",
	},
	settings = {
		json = {
			validate = {
				enable = true,
			},
			schemas = {
				{
					fileMatch = { "package.json" },
					url = "https://json.schemastore.org/package.json",
				},
				{
					fileMatch = { "tsconfig.json" },
					url = "https://json.schemastore.org/tsconfig",
				},
				{
					fileMatch = { "cspell.json" },
					url = "https://raw.githubusercontent.com/streetsidesoftware/cspell/main/cspell.schema.json",
				},
			},
		},
	},
}
