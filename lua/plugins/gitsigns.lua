return {
	"lewis6991/gitsigns.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local gs = require("gitsigns")

		gs.setup()

		vim.keymap.set("n", "]c", function()
			gs.nav_hunk("next")
		end)

		vim.keymap.set("n", "[c", function()
			gs.nav_hunk("prev")
		end)

		vim.keymap.set("n", "<leader>gh", gs.preview_hunk)
		vim.keymap.set("n", "<leader>gb", gs.blame_line)
	end,
}
