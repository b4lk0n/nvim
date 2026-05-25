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

return M
