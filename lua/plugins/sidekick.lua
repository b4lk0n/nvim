return {
	"folke/sidekick.nvim",
	event = { "BufReadPost", "BufNewFile" },
	keys = {
		{
			"<Tab>",
			function()
				if require("sidekick").nes_jump_or_apply() then
					return
				end

				local tab = vim.api.nvim_replace_termcodes("<Tab>", true, false, true)
				vim.api.nvim_feedkeys(tab, "n", false)
			end,
			mode = "n",
			desc = "Goto/Apply Next Edit Suggestion",
		},
	},
	opts = {
		cli = {
			watch = false,
		},
		nes = {
			enabled = true,
		},
	},
}
