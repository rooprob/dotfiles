require("nvchad.mappings")
require("notes")
-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<C-h>", "<Cmd>TmuxNavigateLeft<CR>", { desc = "tmux left pane" })
map("n", "<C-j>", "<Cmd>TmuxNavigateDown<CR>", { desc = "tmux down pane" })
map("n", "<C-k>", "<Cmd>TmuxNavigateUp<CR>", { desc = "tmux up pane" })
map("n", "<C-l>", "<Cmd>TmuxNavigateRight<CR>", { desc = "tmux right pane" })

local fzf = require("fzf-lua")
map("n", "<leader>fa", fzf.files, { desc = "fzf files" })
map("n", "<leader>fb", fzf.buffers, { desc = "fzf buffers" })
map("n", "<leader>ff", fzf.files, { desc = "fzf files" })
map("n", "<leader>fg", fzf.live_grep, { desc = "fzf grep" })
map("n", "<leader>fk", fzf.keymaps, { desc = "fzf keymaps" })
map("n", "<leader>fm", fzf.marks, { desc = "fzf marks" })
map("n", "<leader>fp", "<Cmd>NvimTreeFocus<CR>", { desc = "vimtree" })

map("n", "<leader>bf", fzf.buffers, { desc = "fzf buffers" })
map("n", "<leader>mf", fzf.marks, { desc = "fzf marks" })

map("n", "<leader>gc", fzf.git_commits, { desc = "fzf commits" })
map("n", "<leader>gs", fzf.git_status, { desc = "fzf status" })
