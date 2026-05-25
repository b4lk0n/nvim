local utils = require("utils")

vim.filetype.add({
	filename = {
		["compose.yaml"] = "yaml.docker-compose",
		["compose.yml"] = "yaml.docker-compose",
		["docker-compose.yaml"] = "yaml.docker-compose",
		["docker-compose.yml"] = "yaml.docker-compose",
	},
})

return {
	cmd = {
		utils.get_lsp_path("docker-language-server"),
		"start",
		"--stdio",
	},
	filetypes = {
		"dockerfile",
		"yaml.docker-compose",
	},
	root_markers = {
		"compose.yaml",
		"compose.yml",
		"docker-compose.yaml",
		"docker-compose.yml",
		"Dockerfile",
		".git",
	},
}
