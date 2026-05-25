local M = {}

function M.get_lsp_path(name)
	local path = vim.fn.exepath(name)

	if path ~= "" then
		return path
	end

	return name
end

function M.get_system_appearance()
	local handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")

	if not handle then
		return "dark"
	end

	local result = handle:read("*a")
	local status = handle:close()

	if not status then
		return "dark"
	end

	result = result:gsub("^%s*(.-)%s*$", "%1")

	if result == "Dark" then
		return "dark"
	else
		return "light"
	end
end

function M.scan_lsps(dir)
	local results = {}
	local handle, err = vim.uv.fs_scandir(dir)

	if not handle then
		error("Cannot scan directory: " .. err)
	end

	while true do
		local name, type = vim.uv.fs_scandir_next(handle)

		if not name then
			break
		end

		if type == "file" and name:match("%.lua$") then
			local base_name = name:gsub("%.lua$", "")

			table.insert(results, base_name)
		end
	end

	return results
end

return M
