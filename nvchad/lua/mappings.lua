require("nvchad.mappings")

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
--
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
