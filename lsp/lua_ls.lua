local utils = require("utils")
local config_lua = vim.fn.stdpath("config") .. "/lua"
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
					config_lua,
					runtime_lua,
				},
			},
			telemetry = {
				enable = false,
			},
		},
	},
}
