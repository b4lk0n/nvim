return {
	"rebelot/heirline.nvim",
	config = function()
		local heirline = require("heirline")
		local conditions = require("heirline.conditions")

		local colors = require("theme.statusline").get()

		heirline.load_colors(colors)

		local function get_mode_color()
			local mode = vim.fn.mode(1)

			local mode_colors = {
				n = "blue",
				no = "blue",
				nov = "blue",
				noV = "blue",
				["no\22"] = "blue",
				niI = "blue",
				niR = "blue",
				niV = "blue",
				nt = "blue",
				v = "violet",
				vs = "violet",
				V = "violet",
				Vs = "violet",
				["\22"] = "violet",
				["\22s"] = "violet",
				s = "pink",
				S = "pink",
				["\19"] = "pink",
				i = "green",
				ic = "green",
				ix = "green",
				R = "orange",
				Rc = "orange",
				Rx = "orange",
				Rv = "orange",
				c = "yellow",
				cv = "yellow",
				ce = "yellow",
				r = "aqua",
				rm = "aqua",
				["r?"] = "aqua",
				["!"] = "red",
				t = "red",
			}

			return mode_colors[mode] or "fg"
		end

		local Space = { provider = " " }
		local Align = { provider = "%=" }
		local Gap = { provider = "  " }

		local ModeLetter = {
			static = {
				mode_names = {
					n = "N",
					no = "N",
					nov = "N",
					noV = "N",
					["no\22"] = "N",
					niI = "N",
					niR = "N",
					niV = "N",
					nt = "N",
					v = "V",
					vs = "V",
					V = "V",
					Vs = "V",
					["\22"] = "V",
					["\22s"] = "V",
					s = "S",
					S = "S",
					["\19"] = "S",
					i = "I",
					ic = "I",
					ix = "I",
					R = "R",
					Rc = "R",
					Rx = "R",
					Rv = "R",
					c = "C",
					cv = "C",
					ce = "C",
					r = "P",
					rm = "M",
					["r?"] = "P",
					["!"] = "!",
					t = "T",
				},
			},
			init = function(self)
				self.mode = vim.fn.mode(1)
			end,
			update = { "ModeChanged", "WinEnter", "BufEnter" },
			provider = function(self)
				return self.mode_names[self.mode] or self.mode
			end,
			hl = function()
				return {
					fg = get_mode_color(),
					bold = true,
				}
			end,
		}

		local FileIcon = {
			init = function(self)
				local filename = vim.api.nvim_buf_get_name(0)
				local extension = vim.fn.fnamemodify(filename, ":e")
				local ok, devicons = pcall(require, "nvim-web-devicons")

				self.icon = ""
				self.icon_color = colors.muted

				if ok then
					local icon, icon_color = devicons.get_icon_color(filename, extension, { default = true })
					self.icon = icon or self.icon
					self.icon_color = icon_color or self.icon_color
				end
			end,
			provider = function(self)
				return self.icon
			end,
			hl = function(self)
				return { fg = self.icon_color }
			end,
		}

		local RelativeFilePath = {
			init = function(self)
				local filename = vim.api.nvim_buf_get_name(0)

				if filename == "" then
					self.full_name = "[No Name]"
					self.short_name = self.full_name
					return
				end

				local relative = vim.fn.fnamemodify(filename, ":.")
				self.full_name = relative
				self.short_name = vim.fn.pathshorten(relative)
			end,
			flexible = 2,
			{
				provider = function(self)
					return self.full_name
				end,
			},
			{
				provider = function(self)
					return self.short_name
				end,
			},
			hl = { fg = "fg" },
		}

		local Diagnostics = {
			condition = conditions.has_diagnostics,
			static = {
				error_icon = "󰅚",
				warn_icon = "󰀪",
				info_icon = "󰋽",
				hint_icon = "󰌶",
			},
			init = function(self)
				self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
				self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
				self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
				self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
			end,
			update = { "DiagnosticChanged", "BufEnter" },
			{
				condition = function(self)
					return self.errors > 0
				end,
				provider = function(self)
					return self.error_icon .. self.errors .. " "
				end,
				hl = { fg = "diag_error" },
			},
			{
				condition = function(self)
					return self.warnings > 0
				end,
				provider = function(self)
					return self.warn_icon .. self.warnings .. " "
				end,
				hl = { fg = "diag_warn" },
			},
			{
				condition = function(self)
					return self.info > 0
				end,
				provider = function(self)
					return self.info_icon .. self.info .. " "
				end,
				hl = { fg = "diag_info" },
			},
			{
				condition = function(self)
					return self.hints > 0
				end,
				provider = function(self)
					return self.hint_icon .. self.hints .. " "
				end,
				hl = { fg = "diag_hint" },
			},
		}

		local GitStatus = {
			condition = function()
				return vim.b.gitsigns_status_dict ~= nil
			end,
			init = function(self)
				self.status = vim.b.gitsigns_status_dict or {}
			end,
			update = { "BufEnter", "BufWritePost", "TextChanged", "TextChangedI", "User" },
			{
				provider = function(self)
					local head = self.status.head

					if not head or head == "" then
						return ""
					end

					return " " .. head .. " "
				end,
				hl = { fg = "subtle" },
			},
			{
				condition = function(self)
					return (self.status.added or 0) > 0
				end,
				provider = function(self)
					return "+" .. self.status.added
				end,
				hl = { fg = "green" },
			},
			{
				condition = function(self)
					return (self.status.removed or 0) > 0
				end,
				provider = function(self)
					return "-" .. self.status.removed
				end,
				hl = { fg = "red" },
			},
			{
				condition = function(self)
					return (self.status.changed or 0) > 0
				end,
				provider = function(self)
					return "~" .. self.status.changed
				end,
				hl = { fg = "orange" },
			},
		}

		local LSPActive = {
			condition = conditions.lsp_attached,
			init = function(self)
				local clients = vim.lsp.get_clients({ bufnr = 0 })
				local names = {}

				for _, client in ipairs(clients) do
					table.insert(names, client.name)
				end

				table.sort(names)

				self.lsp_name = names[1]

				if #names > 1 then
					self.lsp_name = self.lsp_name .. " +" .. (#names - 1)
				end
			end,
			update = { "LspAttach", "LspDetach", "BufEnter" },
			provider = function(self)
				return "[" .. self.lsp_name .. "]"
			end,
			hl = { fg = "aqua" },
		}

		local FileOrBufferType = {
			provider = function()
				local filetype = vim.bo.filetype
				local buftype = vim.bo.buftype

				if filetype ~= "" then
					return filetype
				end

				if buftype ~= "" then
					return buftype
				end

				return "text"
			end,
			hl = { fg = "subtle" },
		}

		local Ruler = {
			provider = function()
				local line = vim.fn.line(".")
				local col = vim.fn.col(".")
				local total = vim.fn.line("$")
				local percent = 0

				if total > 0 then
					percent = math.floor((line / total) * 100)
				end

				return string.format("%d:%d %d%%", line, col, percent)
			end,
			hl = { fg = "muted" },
		}

		local ActiveStatusLine = {
			condition = conditions.is_active,
			hl = { fg = "fg", bg = "bg_active" },
			Space,
			{
				FileIcon,
				{ provider = " " },
				ModeLetter,
			},
			Gap,
			RelativeFilePath,
			Align,
			GitStatus,
			{
				condition = function()
					return vim.b.gitsigns_status_dict ~= nil
				end,
				provider = "  ",
			},
			Diagnostics,
			{
				condition = conditions.has_diagnostics,
				provider = " ",
			},
			LSPActive,
			{
				condition = conditions.lsp_attached,
				provider = "  ",
			},
			FileOrBufferType,
			Gap,
			Ruler,
			Space,
		}

		local InactiveFileName = {
			init = function(self)
				local filename = vim.api.nvim_buf_get_name(0)

				if filename == "" then
					self.name = "[No Name]"
					return
				end

				self.name = vim.fn.fnamemodify(filename, ":t")
			end,
			provider = function(self)
				return self.name
			end,
			hl = { fg = "muted" },
		}

		local InactiveStatusLine = {
			hl = { fg = "muted", bg = "bg_dim" },
			Space,
			InactiveFileName,
			Align,
			{
				provider = function()
					return string.format("%d:%d", vim.fn.line("."), vim.fn.col("."))
				end,
				hl = { fg = "subtle" },
			},
			Space,
		}

		heirline.setup({
			statusline = {
				fallthrough = false,
				ActiveStatusLine,
				InactiveStatusLine,
			},
		})
	end,
}
