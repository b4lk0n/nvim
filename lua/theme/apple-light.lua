-- Apple System Colors Light palette
-- Based on the iTerm2 "Apple System Colors Light" theme
-- https://github.com/mbadolato/iTerm2-Color-Schemes
--
-- Shared source of truth: required by both colors/apple-system-light.lua
-- (the colorscheme) and lua/theme/statusline.lua (the heirline resolver).

return {
  -- Base colors from Apple System Colors Light (Ghostty version)
  none = "NONE",            -- Transparent background
  bg = "#feffff",           -- Background
  fg = "#000000",           -- Foreground
  selection = "#b4d7ff",    -- Selection background
  cursor = "#98989d",       -- Cursor color

  -- ANSI Colors (exact match to Ghostty palette)
  black = "#1a1a1a",        -- Palette 0
  red = "#bc4437",          -- Palette 1
  green = "#51a148",        -- Palette 2
  yellow = "#c7ad3a",       -- Palette 3
  blue = "#2e68c5",         -- Palette 4
  magenta = "#8c4bb8",      -- Palette 5
  cyan = "#5e9cbe",         -- Palette 6
  white = "#98989d",        -- Palette 7

  -- Bright colors (exact match to Ghostty palette)
  bright_black = "#464646",   -- Palette 8
  bright_red = "#eb5545",     -- Palette 9
  bright_green = "#6bd45f",   -- Palette 10
  bright_yellow = "#f8d84a",  -- Palette 11
  bright_blue = "#3b82f7",    -- Palette 12
  bright_magenta = "#b260ea", -- Palette 13
  bright_cyan = "#8dd3fb",    -- Palette 14
  bright_white = "#ffffff",   -- Palette 15

  -- Additional derived colors
  comment = "#757575",        -- Medium gray for comments
  line_nr = "#b0b0b0",       -- Line numbers
  visual = "#b4d5fe",        -- Visual selection
  search = "#ffeb3b",        -- Search highlight
  error = "#d32f2f",         -- Error red
  warning = "#ff9800",       -- Warning orange
  info = "#2196f3",          -- Info blue
  hint = "#4caf50",          -- Hint green

  -- UI colors
  pmenu_bg = "#f5f5f5",      -- Popup menu background
  pmenu_sel = "#e3f2fd",     -- Popup menu selection
  statusline = "#e0e0e0",    -- Status line background
  winbar = "#f0f0f0",        -- Window bar background
}
