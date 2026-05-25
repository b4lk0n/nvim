return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
		config = function()
			require("nvim-treesitter.install").prefer_git = true

			require("nvim-treesitter").setup({
				ensure_installed = {
					"lua",
					"json",
					"jsonc",
					"javascript",
					"typescript",
					"tsx",
					"markdown",
				},
				auto_install = true,
				highlight = {
					enable = true,
				},
			})
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-context",
		opts = {
			max_lines = 1,
		},
	},
}
