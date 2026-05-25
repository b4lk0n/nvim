local utils = require("utils")

local lsp_root = vim.fn.stdpath("config") .. "/lsp"
local lsps = utils.scan_lsps(lsp_root)

vim.lsp.enable(lsps)

vim.api.nvim_create_autocmd("VimEnter", {
	group = vim.api.nvim_create_augroup("lsp_enable_startup_buffers", { clear = true }),
	once = true,
	callback = function()
		vim.schedule(function()
			vim.lsp.enable(lsps)
		end)
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp_attach", { clear = true }),
	callback = function(event)
		local opts = {
			buf = event.buf,
			noremap = true,
			silent = true,
		}

		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "gK", vim.lsp.buf.signature_help, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
		vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
		vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
		vim.keymap.set("n", "[d", function()
			vim.diagnostic.jump({ count = -1, float = true })
		end, opts)
		vim.keymap.set("n", "]d", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end, opts)
	end,
})
