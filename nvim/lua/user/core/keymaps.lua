local map = vim.keymap.set

map("n", "<leader>w", "<cmd>w<CR>", { silent = true, desc = "Write" })
map("n", "<leader>q", "<cmd>q<CR>", { silent = true, desc = "Quit" })
map("n", "<leader><Tab>", "<C-^>", { desc = "Alternate buffer" })
map("n", "<leader>ba", "<C-^>", { desc = "Alternate buffer" })
map("n", "<leader>bd", "<cmd>bdelete<CR>", { silent = true, desc = "Delete buffer" })
map("n", "<leader>bk", "<cmd>bdelete<CR>", { silent = true, desc = "Kill buffer" })
map("n", "<leader>bn", "<cmd>bnext<CR>", { silent = true, desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>bprevious<CR>", { silent = true, desc = "Previous buffer" })
map("n", "]b", "<cmd>bnext<CR>", { silent = true, desc = "Next buffer" })
map("n", "[b", "<cmd>bprevious<CR>", { silent = true, desc = "Previous buffer" })
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true, desc = "Clear search" })

-- Navigation handled by vim-tmux-navigator
-- map("n", "<C-h>", "<C-w>h", { desc = "Move left" })
-- map("n", "<C-j>", "<C-w>j", { desc = "Move down" })
-- map("n", "<C-k>", "<C-w>k", { desc = "Move up" })
-- map("n", "<C-l>", "<C-w>l", { desc = "Move right" })

-- <leader>e handled by nvim-tree plugin spec
-- <leader>x* handled by LazyVim
