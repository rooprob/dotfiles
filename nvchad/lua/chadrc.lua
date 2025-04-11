-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v3.0/lua/nvconfig.lua
-- Please read that file to know all available options :(

local options = {

	base46 = {
		theme = "falcon",
		hl_add = {},
		hl_override = {},
		integrations = {},
		changed_themes = {},
		transparency = false,
		theme_toggle = { "onedark", "one_light" },

		-- hl_override = {
		-- 	Comment = { italic = true },
		-- 	["@comment"] = { italic = true },
		-- },
	},

	ui = {
		cmp = {
			icons_left = false, -- only for non-atom styles!
			style = "default", -- default/flat_light/flat_dark/atom/atom_colored
			abbr_maxwidth = 60,
			-- for tailwind, css lsp etc
			format_colors = { lsp = true, icon = "󱓻" },
		},

		telescope = { style = "borderless" }, -- borderless / bordered

		statusline = {
			enabled = true,
			theme = "default", -- default/vscode/vscode_colored/minimal
			-- default/round/block/arrow separators work only for default statusline theme
			-- round and block will work for minimal theme only
			separator_style = "default",
			order = nil,
			modules = nil,
		},

		-- lazyload it when there are 1+ buffers
		tabufline = {
			enabled = true,
			lazyload = true,
			order = { "treeOffset", "buffers", "tabs", "btns" },
			modules = nil,
			bufwidth = 21,
		},
	},
	nvdash = {
		load_on_startup = true,

		header = {
			"                            ",
			"     ▄▄         ▄ ▄▄▄▄▄▄▄   ",
			"   ▄▀███▄     ▄██ █████▀    ",
			"   ██▄▀███▄   ███           ",
			"   ███  ▀███▄ ███           ",
			"   ███    ▀██ ███           ",
			"   ███      ▀ ███           ",
			"   ▀██ █████▄▀█▀▄██████▄    ",
			"     ▀ ▀▀▀▀▀▀▀ ▀▀▀▀▀▀▀▀▀▀   ",
			"                            ",
			"     Powered By  eovim    ",
			"                            ",
		},

		buttons = {
			{ txt = "  Find File", keys = "Spc f f", cmd = "Telescope find_files" },
			{ txt = "  Recent Files", keys = "Spc f o", cmd = "Telescope oldfiles" },
			-- more... check nvconfig.lua file for full list of buttons
		},
	},

	term = {
		winopts = { number = false },
		sizes = { sp = 0.3, vsp = 0.2, ["bo sp"] = 0.3, ["bo vsp"] = 0.2 },
		float = {
			relative = "editor",
			row = 0.3,
			col = 0.25,
			width = 0.5,
			height = 0.4,
			border = "single",
		},
	},
	lsp = {
		signature = true,
	},

	cheatsheet = {
		theme = "grid", -- simple/grid
		excluded_groups = { "terminal (t)", "autopairs", "Nvim", "Opens" }, -- can add group name or with mode
	},

	mason = {
		pkgs = {},
		skip = {},
	},

	colorify = {
		enabled = true,
		mode = "virtual", -- fg, bg, virtual
		virt_text = "󱓻 ",
		highlight = { hex = true, lspvars = true },
	},
}

local status, chadrc = pcall(require, "chadrc")
return vim.tbl_deep_extend("force", options, status and chadrc or {})
