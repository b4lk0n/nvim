return {
	"supermaven-inc/supermaven-nvim",
	event = "InsertEnter",
	config = function()
		local function apply_suggestion_color()
			local colors = require("theme.statusline").get()

			vim.api.nvim_set_hl(0, "SupermavenSuggestion", {
				fg = colors.muted,
			})

			require("supermaven-nvim.completion_preview").suggestion_group = "SupermavenSuggestion"
		end

		require("supermaven-nvim").setup({
			disable_keymaps = true,
			log_level = "off",
		})

		apply_suggestion_color()

		vim.api.nvim_create_autocmd("ColorScheme", {
			group = vim.api.nvim_create_augroup("supermaven_suggestion_color", { clear = true }),
			callback = apply_suggestion_color,
		})
	end,
}
