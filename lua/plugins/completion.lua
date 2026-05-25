return {
	"saghen/blink.cmp",
	dependencies = {
		"xzbdmw/colorful-menu.nvim",
	},
	version = "1.*",
	event = { "InsertEnter", "CmdlineEnter" },
	opts = {
		keymap = {
			preset = "default",
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-k>"] = { "show_signature", "hide_signature", "fallback" },

			["<Tab>"] = {
				"snippet_forward",
				function()
					local ok, sidekick = pcall(require, "sidekick")
					return ok and sidekick.nes_jump_or_apply()
				end,
				function()
					local ok, preview = pcall(require, "supermaven-nvim.completion_preview")
					if ok and preview.has_suggestion() then
						vim.schedule(function()
							if preview.has_suggestion() then
								pcall(preview.on_accept_suggestion)
							end
						end)
						return true
					end
				end,
				"fallback",
			},

			["<Down>"] = { "select_next", "fallback" },
			["<Up>"] = { "select_prev", "fallback" },
			["<CR>"] = { "accept", "fallback" },
		},

		completion = {
			keyword = {
				range = "prefix",
			},

			accept = {
				auto_brackets = {
					enabled = true,
				},
			},

			list = {
				selection = {
					preselect = true,
					auto_insert = false,
				},
			},

			documentation = {
				auto_show = true,
				auto_show_delay_ms = 100,
			},

			ghost_text = {
				enabled = false,
			},

			menu = {
				draw = {
					columns = { { "kind_icon" }, { "label", gap = 1 } },
					treesitter = { "lsp" },
					components = {
						label = {
							text = function(ctx)
								local text = require("colorful-menu").blink_components_text(ctx)

								if text == ctx.label and ctx.label_detail ~= "" then
									return ctx.label .. ctx.label_detail
								end

								return text
							end,
							highlight = function(ctx)
								local text = require("colorful-menu").blink_components_text(ctx)

								if text == ctx.label and ctx.label_detail ~= "" then
									return {
										{
											0,
											#ctx.label,
											group = ctx.deprecated and "BlinkCmpLabelDeprecated" or "BlinkCmpLabel",
										},
										{ #ctx.label, #ctx.label + #ctx.label_detail, group = "BlinkCmpLabelDetail" },
									}
								end

								return require("colorful-menu").blink_components_highlight(ctx)
							end,
						},
					},
				},
			},
		},

		signature = {
			enabled = true,
			trigger = {
				enabled = true,
			},
			window = {
				show_documentation = true,
			},
		},

		cmdline = {},

		sources = {
			default = { "lsp", "path", "buffer" },

			providers = {},
		},
	},
	opts_extend = { "sources.default" },
}
