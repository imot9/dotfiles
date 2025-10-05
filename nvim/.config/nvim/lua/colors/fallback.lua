local M = {}

local colors = {
  bg = "#1e1e1e",
  fg = "#d4d4d4",
  bg_dark = "#1a1a1a",
  bg_light = "#2d2d2d",

  gray = "#5a5a5a",
  blue = "#569cd6",
  cyan = "#4ec9b0",
  green = "#6a9955",
  orange = "#ce9178",
  yellow = "#dcdcaa",
  red = "#f48771",
  purple = "#c586c0",

  -- Bright variants
  bright_blue = "#4fc1ff",
  bright_cyan = "#9cdcfe",
  bright_green = "#b5cea8",
}

local function highlight(group, opts)
  local cmd = "hi " .. group
  if opts.fg then cmd = cmd .. " guifg=" .. opts.fg end
  if opts.bg then cmd = cmd .. " guibg=" .. opts.bg end
  if opts.gui then cmd = cmd .. " gui=" .. opts.gui end
  vim.cmd(cmd)
end

function M.setup()
  vim.cmd("hi clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end

  vim.g.colors_name = "fallback"

  -- UI
  vim.opt.cursorline = true
  highlight("Normal", { fg = colors.fg, bg = colors.bg })
  highlight("LineNr", { fg = colors.gray })
  highlight("CursorLine", { bg = colors.bg_light })
  highlight("CursorLineNr", { fg = colors.green, gui = "bold" })
  highlight("Visual", { bg = "#264f78" })
  highlight("Search", { bg = "#613214" })
  highlight("IncSearch", { bg = "#ff9800", fg = "#000000" })

  -- Statusline
  highlight("StatusLine", { fg = colors.fg, bg = "#3c3c3c" })
  highlight("StatusLineNC", { fg = colors.gray, bg = colors.bg_light })

  -- Popups
  highlight("Pmenu", { fg = colors.fg, bg = colors.bg_light })
  highlight("PmenuSel", { fg = colors.fg, bg = "#094771" })

  -- Syntax
  highlight("Comment", { fg = colors.green, gui = "italic" })
  highlight("Constant", { fg = colors.bright_blue })
  highlight("String", { fg = colors.orange })
  highlight("Number", { fg = colors.bright_green })
  highlight("Boolean", { fg = colors.blue })

  highlight("Identifier", { fg = colors.bright_cyan })
  highlight("Function", { fg = colors.yellow })

  highlight("Statement", { fg = colors.purple })
  highlight("Conditional", { fg = colors.purple })
  highlight("Repeat", { fg = colors.purple })
  highlight("Keyword", { fg = colors.blue })
  highlight("Operator", { fg = colors.fg })

  highlight("PreProc", { fg = colors.purple })
  highlight("Type", { fg = colors.cyan })
  highlight("StorageClass", { fg = colors.blue })

  highlight("Special", { fg = colors.yellow })
  highlight("Delimiter", { fg = colors.fg })

  -- Errors
  highlight("Error", { fg = colors.red })
  highlight("ErrorMsg", { fg = colors.red })
  highlight("WarningMsg", { fg = "#cca700" })

  -- Diff
  highlight("DiffAdd", { fg = "#4b5632" })
  highlight("DiffChange", { fg = "#2f3f5c" })
  highlight("DiffDelete", { fg = "#6f2c2c" })

  -- Tree-sitter
  highlight("@variable", { fg = colors.bright_cyan })
  highlight("@function", { fg = colors.yellow })
  highlight("@keyword", { fg = colors.blue })
  highlight("@string", { fg = colors.orange })
  highlight("@number", { fg = colors.bright_green })
  highlight("@boolean", { fg = colors.blue })
  highlight("@comment", { fg = colors.green, gui = "italic" })
  highlight("@type", { fg = colors.cyan })
  highlight("@operator", { fg = colors.fg })

  -- Keywords (return, end, function, if, etc.) - Purple
  highlight("@keyword", { fg = colors.purple })
  highlight("@keyword.function", { fg = colors.purple })
  highlight("@keyword.return", { fg = colors.purple })
  highlight("@keyword.operator", { fg = colors.purple })
end

return M
