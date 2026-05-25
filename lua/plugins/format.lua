return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	keys = {
		{
			"<leader>f",
			function()
				require("conform").format({ async = true })
			end,
			mode = "",
			desc = "Format buffer",
		},
	},
	opts = function()
		local conform_util = require("conform.util")
		local utils = require("utils")

		return {
			format_on_save = true,
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "biome-check", stop_after_first = true },
				javascriptreact = { "biome-check", stop_after_first = true },
				typescript = { "biome-check", stop_after_first = true },
				typescriptreact = { "biome-check", stop_after_first = true },
				json = { "biome-check", stop_after_first = true },
				jsonc = { "biome-check", stop_after_first = true },
				css = { "biome-check", stop_after_first = true },
			},
			formatters = {
				["biome-check"] = {
					command = conform_util.find_executable(
						{ "node_modules/.bin/biome" },
						utils.get_lsp_path("biome")
					),
				},
			},
		}
	end,
}
