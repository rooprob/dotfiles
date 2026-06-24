vim.g.mapleader = " "
vim.g.maplocalleader = " "

local config_root = vim.fn.fnamemodify(debug.getinfo(1, "S").source:sub(2), ":p:h")
package.path = config_root .. "/lua/?.lua;" .. config_root .. "/lua/?/init.lua;" .. package.path

require("user.core.options")
require("user.core.keymaps")
require("user.lazy")
