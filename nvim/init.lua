vim.g.mapleader = " "
vim.g.maplocalleader = " "

local config_root = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p:h")
package.path = config_root .. "/lua/?.lua;" .. config_root .. "/lua/?/init.lua;" .. package.path

require("user.core.options")
require("user.core.keymaps")
require("user.lazy")
require("user.themes.dracowl").setup()

require("user.plugins.nvchad")
require("user.plugins.treesitter")
require("user.plugins.completion")
require("user.plugins.telescope")
require("user.plugins.ui")
require("user.plugins.editing")
require("user.plugins.formatting")
require("user.lsp")

pcall(require, "user.lang.python")
pcall(require, "user.lang.go")
pcall(require, "user.lang.odin")
pcall(require, "user.lang.nix")
