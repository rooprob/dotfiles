-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("i", "jk", "<ESC>", { silent = true })

-- https://www.reddit.com/r/neovim/comments/10wru1c/how_do_i_resize_windows/
vim.keymap.set("n", "=", "<cmd>vertical resize +5<cr>") -- make the window biger vertically
vim.keymap.set("n", "-", "<cmd>vertical resize -5<cr>") -- make the window smaller vertically
vim.keymap.set("n", "+", "<cmd>horizontal resize +2<cr>") -- make the window bigger horizontally by pressing shift and =
vim.keymap.set("n", "_", "<cmd>horizontal resize -2<cr>") -- make the window smaller horizontally by pressing shift and -
