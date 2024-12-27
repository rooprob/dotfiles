vim.g.mapleader = " "
vim.keymap.set("i", "jk", "<ESC>", { silent = true })

vim.keymap.set("n", "<leader>pv", "<cmd>:Neotree position=left<cr>", { desc = "Open Filesystem tree" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Function to prompt for user input and execute a shell command
function run_newnote(section)
	local note = vim.fn.input("Note " .. section)
	vim.env.SECTION = section
	local output = vim.fn.system("nn", note)
	local path = output:match("%b()") -- Get the content within parentheses
	local filename = path:sub(2, -2) -- Remove the surrounding parentheses

	if vim.fn.filereadable(filename) == 1 then
		vim.cmd("edit" .. vim.fn.fnameescape(filename))
	end
end

function note_from_selection(section)
	vim.env.SECTION = section
	local selected_text = vim.fn.getreg('"')

	local output = vim.fn.system("nn", selected_text)
	output = vim.fn.trim(output)

	local row, col = unpack(vim.api.nvim_win_get_cursor(0))
	vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { output })

	local path = output:match("%b()") -- Get the content within parentheses
	local filename = path:sub(2, -2) -- Remove the surrounding parentheses

	if vim.fn.filereadable(filename) == 1 then
		vim.cmd("edit" .. vim.fn.fnameescape(filename))
	end
end

vim.keymap.set("n", "<leader>nm", [[:lua run_newnote("meetings")<CR>]], { desc = "Create meeting new note" })
vim.keymap.set("n", "<leader>nn", [[:lua run_newnote("zet")<CR>]], { desc = "Create new note" })
vim.keymap.set("v", "<leader>nn", [[c<esc>:lua note_from_selection('zet')<cr>]], { desc = "Create new note from text" })
-- vim.keymap.set(
--     "v",
--     "<leader>nn",
--     "c<C-R>=trim(system('nn',  getreg('\"')))<CR>",
--     { desc = "Create new note from text" }
-- )

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>vwm", function()
	require("vim-with-me").StartVimWithMe()
end)
vim.keymap.set("n", "<leader>svwm", function()
	require("vim-with-me").StopVimWithMe()
end)

-- stop tmux alt-jk moving lines
vim.keymap.set({ "n", "i" }, "<A-j>", "")
vim.keymap.set({ "n", "i" }, "<A-k>", "")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader>ee", "oif err != nil {<CR>}<Esc>Oreturn err<Esc>")

vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>")
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>")

vim.keymap.set("n", "<leader><leader>", function()
	vim.cmd("so")
end)

-- 27/12/24 Geting error from telescope builtin does not exist
-- local builtin = require("telescope.builtin")
-- vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Project files" })
-- vim.keymap.set("n", "<leader>pt", builtin.git_files, { desc = "Search git files" })
--
-- vim.keymap.set("n", "<leader>pg", function()
-- 	local word = vim.fn.expand("<cword>")
-- 	builtin.grep_string({ search = word })
-- end, { desc = "Project word search" })
--
-- vim.keymap.set("n", "<leader>pG", function()
-- 	local word = vim.fn.expand("<cWORD>")
-- 	builtin.grep_string({ search = word })
-- end, { desc = "Project WORD search" })
--
-- vim.keymap.set("n", "<leader>ph", builtin.help_tags, { desc = "Project help" })
-- vim.keymap.set("n", "<leader>pb", builtin.buffers, { desc = "Project buffers" })

-- https://www.reddit.com/r/neovim/comments/10wru1c/how_do_i_resize_windows/
vim.keymap.set("n", "=", "<cmd>vertical resize +5<cr>") -- make the window biger vertically
vim.keymap.set("n", "-", "<cmd>vertical resize -5<cr>") -- make the window smaller vertically
vim.keymap.set("n", "+", "<cmd>horizontal resize +2<cr>") -- make the window bigger horizontally by pressing shift and =
vim.keymap.set("n", "_", "<cmd>horizontal resize -2<cr>") -- make the window smaller horizontally by pressing shift and -

vim.keymap.set("n", "<S-h>", function()
	local bufs = vim.api.nvim_list_bufs()
	local cb = vim.api.nvim_get_current_buf()

	-- are we on the head of the active list
	local is_head = false
	for i, v in ipairs(bufs) do
		if vim.api.nvim_buf_is_loaded(v) then
			if is_head == false then
				is_head = true
			end
		end
		if is_head then
			if v == cb then
				print("would move to window left...")
				vim.cmd("TmuxNavigateLeft")
				return
			end
			break
		end
	end

	print("moving to buffer left...")
	vim.cmd("BufferLineCyclePrev")
end, { desc = "Prev Buffer" })

vim.keymap.set("n", "<S-l>", function()
	local bufs = vim.api.nvim_list_bufs()
	local cb = vim.api.nvim_get_current_buf()

	-- are we on the tail of the active list
	local is_tail = false
	for i = #bufs, 1, -1 do
		if vim.api.nvim_buf_is_loaded(bufs[i]) then
			if is_tail == false then
				is_tail = true
			end
		end
		if is_tail then
			if bufs[i] == cb then
				print("would move to window right...")
				vim.cmd("TmuxNavigateRight")
				return
			end
			break
		end
	end

	print("moving to buffer right...")
	vim.cmd("BufferLineCycleNext")
end, { desc = "Next Buffer" })
