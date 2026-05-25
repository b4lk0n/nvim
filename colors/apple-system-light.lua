-- Apple System Colors Light colorscheme for Neovim
-- Based on the iTerm2 "Apple System Colors Light" theme
-- https://github.com/mbadolato/iTerm2-Color-Schemes

local colors = require("theme.apple-light")

-- Clear existing highlights and set background
vim.cmd("highlight clear")
if vim.fn.exists("syntax_on") then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "apple_system_light"
vim.opt.background = "light"

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- Editor highlights
hi("Normal", { fg = colors.fg, bg = colors.none })
hi("NormalNC", { fg = colors.fg, bg = colors.none })
hi("EndOfBuffer", { fg = colors.line_nr, bg = colors.none })
hi("NormalFloat", { fg = colors.fg, bg = colors.pmenu_bg })
hi("FloatBorder", { fg = colors.comment, bg = colors.pmenu_bg })
hi("FloatTitle", { fg = colors.fg, bg = colors.pmenu_bg, bold = true })

-- Cursor and visual
hi("Cursor", { fg = colors.bg, bg = colors.cursor })
hi("CursorLine", { bg = "#f8f8f8" })
hi("CursorColumn", { bg = "#f8f8f8" })
hi("Visual", { bg = colors.visual })
hi("VisualNOS", { bg = colors.visual })

-- Line numbers and columns
hi("LineNr", { fg = colors.line_nr })
hi("CursorLineNr", { fg = colors.fg, bold = true })
hi("SignColumn", { bg = colors.none })
hi("FoldColumn", { fg = colors.comment, bg = colors.none })
hi("ColorColumn", { bg = "#f0f0f0" })

-- Search and matching
hi("Search", { fg = colors.black, bg = colors.search })
hi("IncSearch", { fg = colors.black, bg = colors.bright_yellow })
hi("CurSearch", { fg = colors.black, bg = colors.bright_yellow })
hi("MatchParen", { fg = colors.bright_red, bold = true, underline = true })

-- Messages and prompts
hi("ErrorMsg", { fg = colors.error, bold = true })
hi("WarningMsg", { fg = colors.warning, bold = true })
hi("ModeMsg", { fg = colors.fg, bold = true })
hi("MoreMsg", { fg = colors.green, bold = true })
hi("Question", { fg = colors.blue, bold = true })

-- Status line and tabs
hi("StatusLine", { fg = colors.fg, bg = colors.statusline })
hi("StatusLineNC", { fg = colors.comment, bg = colors.statusline })
hi("TabLine", { fg = colors.comment, bg = colors.statusline })
hi("TabLineFill", { bg = colors.statusline })
hi("TabLineSel", { fg = colors.fg, bg = colors.bg, bold = true })
hi("WinBar", { fg = colors.fg, bg = colors.winbar })
hi("WinBarNC", { fg = colors.comment, bg = colors.winbar })

-- Popup menu
hi("Pmenu", { fg = colors.fg, bg = colors.pmenu_bg })
hi("PmenuSel", { fg = colors.fg, bg = colors.pmenu_sel, bold = true })
hi("PmenuSbar", { bg = colors.comment })
hi("PmenuThumb", { bg = colors.fg })
hi("PmenuKind", { fg = colors.blue, bg = colors.pmenu_bg })
hi("PmenuKindSel", { fg = colors.blue, bg = colors.pmenu_sel, bold = true })
hi("PmenuExtra", { fg = colors.comment, bg = colors.pmenu_bg })
hi("PmenuExtraSel", { fg = colors.comment, bg = colors.pmenu_sel })

-- Syntax highlighting
hi("Comment", { fg = colors.comment, italic = true })
hi("Todo", { fg = colors.bright_yellow, bg = colors.yellow, bold = true })

-- Constants
hi("Constant", { fg = colors.red })
hi("String", { fg = colors.green })
hi("Character", { fg = colors.green })
hi("Number", { fg = colors.blue })
hi("Boolean", { fg = colors.red })
hi("Float", { fg = colors.blue })

-- Identifiers
hi("Identifier", { fg = colors.fg })
hi("Function", { fg = colors.blue, bold = true })

-- Statements
hi("Statement", { fg = colors.magenta, bold = true })
hi("Conditional", { fg = colors.magenta, bold = true })
hi("Repeat", { fg = colors.magenta, bold = true })
hi("Label", { fg = colors.magenta, bold = true })
hi("Operator", { fg = colors.fg })
hi("Keyword", { fg = colors.magenta, bold = true })
hi("Exception", { fg = colors.red, bold = true })

-- Preprocessor
hi("PreProc", { fg = colors.cyan })
hi("Include", { fg = colors.cyan })
hi("Define", { fg = colors.cyan })
hi("Macro", { fg = colors.cyan })
hi("PreCondit", { fg = colors.cyan })

-- Types
hi("Type", { fg = colors.yellow, bold = true })
hi("StorageClass", { fg = colors.yellow, bold = true })
hi("Structure", { fg = colors.yellow, bold = true })
hi("Typedef", { fg = colors.yellow, bold = true })

-- Special
hi("Special", { fg = colors.bright_magenta })
hi("SpecialChar", { fg = colors.bright_magenta })
hi("Tag", { fg = colors.bright_magenta })
hi("Delimiter", { fg = colors.fg })
hi("SpecialComment", { fg = colors.bright_cyan, italic = true })
hi("Debug", { fg = colors.error })

-- Other
hi("Underlined", { fg = colors.blue, underline = true })
hi("Ignore", { fg = colors.comment })
hi("Error", { fg = colors.error, bold = true })

-- Diff
hi("DiffAdd", { fg = colors.green, bg = "#e8f5e8" })
hi("DiffChange", { fg = colors.yellow, bg = "#fff8e1" })
hi("DiffDelete", { fg = colors.red, bg = "#ffebee" })
hi("DiffText", { fg = colors.bright_yellow, bg = "#ffecb3", bold = true })

-- Spelling
hi("SpellBad", { fg = colors.error, undercurl = true })
hi("SpellCap", { fg = colors.warning, undercurl = true })
hi("SpellLocal", { fg = colors.info, undercurl = true })
hi("SpellRare", { fg = colors.hint, undercurl = true })

-- LSP and diagnostics
hi("DiagnosticError", { fg = colors.error })
hi("DiagnosticWarn", { fg = colors.warning })
hi("DiagnosticInfo", { fg = colors.info })
hi("DiagnosticHint", { fg = colors.hint })
hi("DiagnosticUnderlineError", { undercurl = true, sp = colors.error })
hi("DiagnosticUnderlineWarn", { undercurl = true, sp = colors.warning })
hi("DiagnosticUnderlineInfo", { undercurl = true, sp = colors.info })
hi("DiagnosticUnderlineHint", { undercurl = true, sp = colors.hint })

-- Tree-sitter highlights (some common ones)
hi("@comment", { link = "Comment" })
hi("@string", { link = "String" })
hi("@number", { link = "Number" })
hi("@boolean", { link = "Boolean" })
hi("@function", { link = "Function" })
hi("@keyword", { link = "Keyword" })
hi("@type", { link = "Type" })
hi("@variable", { fg = colors.fg })
hi("@parameter", { fg = colors.fg, italic = true })
hi("@property", { fg = colors.bright_blue })
hi("@field", { fg = colors.bright_blue })
hi("@constant", { link = "Constant" })
hi("@constructor", { fg = colors.yellow })
hi("@operator", { link = "Operator" })
hi("@punctuation", { fg = colors.fg })

-- Git signs (if using gitsigns.nvim)
hi("GitSignsAdd", { fg = colors.green })
hi("GitSignsChange", { fg = colors.yellow })
hi("GitSignsDelete", { fg = colors.red })

-- Window separators
hi("WinSeparator", { fg = colors.comment })
hi("VertSplit", { link = "WinSeparator" })

-- Directory and file explorer
hi("Directory", { fg = colors.blue, bold = true })
hi("Title", { fg = colors.fg, bold = true })

-- Folds
hi("Folded", { fg = colors.comment, bg = "#f0f0f0", italic = true })

-- Terminal colors (exact match to Ghostty palette)
vim.g.terminal_color_0 = "#1a1a1a"   -- Palette 0
vim.g.terminal_color_1 = "#bc4437"   -- Palette 1
vim.g.terminal_color_2 = "#51a148"   -- Palette 2
vim.g.terminal_color_3 = "#c7ad3a"   -- Palette 3
vim.g.terminal_color_4 = "#2e68c5"   -- Palette 4
vim.g.terminal_color_5 = "#8c4bb8"   -- Palette 5
vim.g.terminal_color_6 = "#5e9cbe"   -- Palette 6
vim.g.terminal_color_7 = "#98989d"   -- Palette 7
vim.g.terminal_color_8 = "#464646"   -- Palette 8
vim.g.terminal_color_9 = "#eb5545"   -- Palette 9
vim.g.terminal_color_10 = "#6bd45f"  -- Palette 10
vim.g.terminal_color_11 = "#f8d84a"  -- Palette 11
vim.g.terminal_color_12 = "#3b82f7"  -- Palette 12
vim.g.terminal_color_13 = "#b260ea"  -- Palette 13
vim.g.terminal_color_14 = "#8dd3fb"  -- Palette 14
vim.g.terminal_color_15 = "#ffffff"  -- Palette 15

