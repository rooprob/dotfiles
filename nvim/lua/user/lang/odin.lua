local lsp = require("user.lsp")

lsp.setup("ols")

vim.api.nvim_create_autocmd("FileType", {
	pattern = "odin",
	callback = function()
		local opts = { buffer = true, silent = true }
		vim.keymap.set("n", "<leader>or", ":!odin run .<CR>", vim.tbl_extend("force", opts, { desc = "Odin run" }))
		vim.keymap.set("n", "<leader>ob", ":!odin build .<CR>", vim.tbl_extend("force", opts, { desc = "Odin build" }))
		vim.keymap.set("n", "<leader>ot", ":!odin test .<CR>", vim.tbl_extend("force", opts, { desc = "Odin test" }))
		vim.keymap.set("n", "<leader>oc", ":!odin check .<CR>", vim.tbl_extend("force", opts, { desc = "Odin check" }))
	end,
})
