local utils = require("utils")
local runtime_lua = vim.env.VIMRUNTIME .. "/lua"

return {
	cmd = {
		utils.get_lsp_path("lua-language-server"),
	},
	filetypes = {
		"lua",
	},
	root_markers = {
		".luarc.json",
		".luarc.jsonc",
		".git",
	},
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
			},
			diagnostics = {
				globals = {
					"vim",
				},
			},
			workspace = {
				checkThirdParty = false,
				library = {
					runtime_lua,
				},
			},
			telemetry = {
				enable = false,
			},
		},
	},
}
