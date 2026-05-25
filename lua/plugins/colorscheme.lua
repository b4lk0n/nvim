return {
	"nkxxll/ghostty-default-style-dark.nvim",
	priority = 1000,
	lazy = false,
	config = function()
		require("ghostty-default-style-dark").setup({
			transparent = true,
			dim_inactive = true,
			styles = {
				sidebars = "transparent",
				floats = "transparent",
			},
		})

		local utils = require("utils")
		local appearance = utils.get_system_appearance()

		if appearance == "light" then
			vim.opt.background = "light"
			vim.cmd.colorscheme("apple-system-light")
		else
			vim.opt.background = "dark"
			vim.cmd.colorscheme("ghostty-default-style-dark")
		end
	end,
}
