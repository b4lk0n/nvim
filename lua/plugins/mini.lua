return {
	"echasnovski/mini.nvim",
	event = "VeryLazy",
	config = function()
		require("mini.ai").setup({ n_lines = 500 })
		require("mini.surround").setup()
		require("mini.move").setup()
		require("mini.tabline").setup()
		-- require("mini.cursorword").setup()

		vim.api.nvim_set_hl(0, "MiniTablineFill", {
			bg = "none",
		})
	end,
}
