local map = vim.keymap.set

map("n", "<leader>w", "<cmd>w<CR>", { silent = true, desc = "Write" })
map("n", "<leader>q", "<cmd>q<CR>", { silent = true, desc = "Quit" })
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true, desc = "Clear search" })

-- Navigation handled by vim-tmux-navigator
-- map("n", "<C-h>", "<C-w>h", { desc = "Move left" })
-- map("n", "<C-j>", "<C-w>j", { desc = "Move down" })
-- map("n", "<C-k>", "<C-w>k", { desc = "Move up" })
-- map("n", "<C-l>", "<C-w>l", { desc = "Move right" })

map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { silent = true, desc = "File tree" })
map("n", "<leader>xx", vim.diagnostic.setqflist, { desc = "Diagnostics quickfix" })
map("n", "<leader>xd", vim.diagnostic.open_float, { desc = "Line diagnostics" })
