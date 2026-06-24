local M = {}

M.palette = {
	bg = "#030c1b",
	bg_alt = "#000815",
	bg_soft = "#071527",
	surface = "#0d1b2e",
	surface_alt = "#14243a",
	fg = "#cccccc",
	muted = "#7f848e",
	subtle = "#3f4a63",
	lilac = "#a179fb",
	blue = "#4d91fb",
	cyan = "#9cdcfe",
	green = "#66ffb4",
	yellow = "#fbe179",
	pink = "#fc60a1",
	red = "#fb5474",
}

local function hl(group, opts)
	vim.api.nvim_set_hl(0, group, opts)
end

function M.apply()
	local c = M.palette
	hl("Normal", { fg = c.fg, bg = c.bg })
	hl("NormalFloat", { fg = c.fg, bg = c.bg_alt })
	hl("FloatBorder", { fg = c.lilac, bg = c.bg_alt })
	hl("LineNr", { fg = c.subtle })
	hl("CursorLine", { bg = c.bg_soft })
	hl("CursorLineNr", { fg = c.lilac, bold = true })
	hl("Visual", { bg = "#264f78" })
	hl("Pmenu", { fg = c.fg, bg = c.bg_alt })
	hl("PmenuSel", { fg = c.bg, bg = c.cyan, bold = true })
	hl("StatusLine", { fg = c.fg, bg = c.surface })
	hl("StatusLineNC", { fg = c.muted, bg = c.bg_alt })
	hl("TabLineSel", { fg = c.bg, bg = c.lilac, bold = true })
	hl("DiagnosticError", { fg = c.red })
	hl("DiagnosticWarn", { fg = c.yellow })
	hl("DiagnosticInfo", { fg = c.blue })
	hl("DiagnosticHint", { fg = c.cyan })
	hl("GitSignsAdd", { fg = c.green })
	hl("GitSignsChange", { fg = c.yellow })
	hl("GitSignsDelete", { fg = c.red })
end

function M.setup()
	vim.cmd.colorscheme("catppuccin-mocha")
	M.apply()
end

return M
