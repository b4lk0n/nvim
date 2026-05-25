return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	config = function()
		require("neo-tree").setup({
			close_if_last_window = true,
			popup_border_style = "",
			sort_case_insensitive = true,
			window = {
				position = "right",
			},
			filesystem = {
				filtered_items = {
					visible = true,
				},
				hijack_netrw_behavior = "disabled",
				follow_current_file = {
					enabled = true,
				},
			},
		})

		vim.keymap.set("n", "<leader>ft", "<cmd>Neotree toggle float<cr>")
		vim.keymap.set("n", "<leader>lt", "<cmd>Neotree toggle left<cr>")
		vim.keymap.set("n", "<leader>rt", "<cmd>Neotree toggle left<cr>")
	end,
}
