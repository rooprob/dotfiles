vim.g.base46_cache = vim.fn.stdpath("cache") .. "/base46/"

local ok, nvchad = pcall(require, "nvchad")
if ok and type(nvchad) == "table" and type(nvchad.setup) == "function" then
	nvchad.setup({
		ui = {
			theme = "dracowl",
			transparency = false,
		},
	})
end

local ok_ui, ui = pcall(require, "nvchad_ui")
if ok_ui and type(ui) == "table" and type(ui.setup) == "function" then
	ui.setup()
end
