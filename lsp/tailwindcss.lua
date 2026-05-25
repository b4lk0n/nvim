local utils = require("utils")

local config_files = {
	"tailwind.config.js",
	"tailwind.config.cjs",
	"tailwind.config.mjs",
	"tailwind.config.ts",
	"postcss.config.js",
	"postcss.config.cjs",
	"postcss.config.mjs",
	"postcss.config.ts",
}

local workspace_files = {
	"pnpm-workspace.yaml",
	"pnpm-lock.yaml",
	"yarn.lock",
	"package-lock.json",
	"bun.lockb",
	"bun.lock",
}

local function package_uses_tailwind(package_json)
	local lines = vim.fn.readfile(package_json)
	local content = table.concat(lines, "\n")

	return content:find('"tailwindcss"', 1, true) ~= nil
		or content:find('"@tailwindcss/', 1, true) ~= nil
end

local function find_tailwind_root(bufnr, on_dir)
	local path = vim.api.nvim_buf_get_name(bufnr)

	if path == "" then
		path = vim.uv.cwd()
	end

	local start = vim.fs.dirname(path)
	local config = vim.fs.find(config_files, { path = start, upward = true })[1]

	if config then
		on_dir(vim.fs.dirname(config))
		return
	end

	local packages = vim.fs.find("package.json", { path = start, upward = true, limit = math.huge })

	for _, package_json in ipairs(packages) do
		if package_uses_tailwind(package_json) then
			local workspace = vim.fs.find(workspace_files, {
				path = vim.fs.dirname(package_json),
				upward = true,
			})[1]

			on_dir(vim.fs.dirname(workspace or package_json))
			return
		end
	end
end

return {
	cmd = {
		utils.get_lsp_path("tailwindcss-language-server"),
		"--stdio",
	},
	filetypes = {
		"html",
		"markdown",
		"css",
		"javascript",
		"javascriptreact",
		"typescript",
		"typescriptreact",
		"mdx",
	},
	root_dir = find_tailwind_root,
	settings = {
		tailwindCSS = {
			validate = true,
			lint = {
				cssConflict = "warning",
				invalidApply = "error",
				invalidScreen = "error",
				invalidVariant = "error",
				invalidConfigPath = "error",
				invalidTailwindDirective = "error",
				recommendedVariantOrder = "warning",
			},
			classAttributes = {
				"class",
				"className",
			},
			classFunctions = {
				"cn",
				"clsx",
				"cva",
			},
			includeLanguages = {
				templ = "html",
				htmlangular = "html",
			},
		},
	},
}
