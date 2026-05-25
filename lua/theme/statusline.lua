-- Statusline palette resolver for heirline.
--
-- Returns a heirline-ready color table derived from whichever colorscheme is
-- active. The active scheme is chosen in lua/plugins/colorscheme.lua based on
-- macOS system appearance, which also sets `vim.o.background`. That plugin
-- loads before heirline (priority = 1000, lazy = false), so `vim.o.background`
-- is reliable here.

local M = {}

function M.get()
  if vim.o.background == "light" then
    local p = require("theme.apple-light")
    return {
      fg = p.fg,
      muted = p.comment,
      subtle = p.line_nr,
      bg = p.bg,
      bg_dim = p.winbar,
      bg_active = p.statusline,
      blue = p.blue,
      aqua = p.cyan,
      green = p.green,
      yellow = p.yellow,
      red = p.red,
      orange = p.warning,
      pink = p.magenta,
      violet = p.bright_magenta,
      diag_error = p.error,
      diag_warn = p.warning,
      diag_info = p.info,
      diag_hint = p.hint,
    }
  end

  local c = require("ghostty-default-style-dark.colors").setup({
    transparent = true,
    styles = { sidebars = "transparent", floats = "transparent" },
  })
  return {
    fg = c.fg,
    muted = c.fg_dark,
    subtle = c.comment,
    bg = c.bg,
    bg_dim = c.bg_dark,
    bg_active = c.bg_highlight,
    blue = c.blue,
    aqua = c.cyan,
    green = c.green,
    yellow = c.yellow,
    red = c.red,
    orange = c.orange,
    pink = c.magenta,
    violet = c.magenta2,
    diag_error = c.error,
    diag_warn = c.warning,
    diag_info = c.info,
    diag_hint = c.hint,
  }
end

return M
