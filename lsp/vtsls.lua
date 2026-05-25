local utils = require("utils")

return {
	cmd = {
		utils.get_lsp_path("vtsls"),
		"--stdio",
	},
	filetypes = {
		"javascript",
		"javascriptreact",
		"javascript.jsx",
		"typescript",
		"typescriptreact",
		"typescript.tsx",
	},
	root_markers = {
		"tsconfig.json",
		"package.json",
		"pnpm-workspace.yaml",
		"pnpm-lock.yaml",
		"yarn.lock",
		"package-lock.json",
		"bun.lockb",
		"bun.lock",
		".git",
	},
	settings = {
		vtsls = {
			autoUseWorkspaceTsdk = true,
			experimental = {
				completion = {
					entiresLimit = 50,
				},
			},
		},
		typescript = {
			tsserver = {
				maxTsServerMemory = 8192,
			},
		},
	},
}
