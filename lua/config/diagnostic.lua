vim.diagnostic.config({
	severity_sort = true,
	update_in_insert = false,
	virtual_text = {
		source = "if_many",
		spacing = 2,
		prefix = "●",
	},
	float = {
		border = "rounded",
		source = "if_many",
	},
	jump = {
		float = true,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "E",
			[vim.diagnostic.severity.WARN] = "W",
			[vim.diagnostic.severity.INFO] = "I",
			[vim.diagnostic.severity.HINT] = "H",
		},
	},
})
