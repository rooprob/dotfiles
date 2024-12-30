-- Function to prompt for user input and execute a shell command
function NewNote(section)
	local note = vim.fn.input("Note " .. section)
	vim.env.SECTION = section
	local output = vim.fn.system("nn", note)
	local path = output:match("%b()") -- Get the content within parentheses
	local filename = path:sub(2, -2) -- Remove the surrounding parentheses

	if vim.fn.filereadable(filename) == 1 then
		vim.cmd("edit" .. vim.fn.fnameescape(filename))
	end
end

function NewNoteFromSelection(section)
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

vim.keymap.set("n", "<leader>nm", [[:lua NewNote("meetings")<CR>]], { desc = "Create meeting new note" })
vim.keymap.set("n", "<leader>nn", [[:lua NewNote("zet")<CR>]], { desc = "Create new note" })
vim.keymap.set("v", "<leader>nn", [[<esc>:lua NewNoteFromSelection('zet')<CR>]], { desc = "Create new note from text" })
-- vim.keymap.set(
--     "v",
--     "<leader>nn",
--     "c<C-R>=trim(system('nn',  getreg('\"')))<CR>",
--     { desc = "Create new note from text" }
-- )
