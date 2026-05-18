local lsp = require("user.lsp")

lsp.setup("ols")

vim.api.nvim_create_autocmd("FileType", {
	pattern = "odin",
	callback = function()
		local opts = { buffer = true, silent = true }
		vim.keymap.set("n", "<leader>or", ":!odin run .<CR>", opts)
		vim.keymap.set("n", "<leader>ob", ":!odin build .<CR>", opts)
		vim.keymap.set("n", "<leader>ot", ":!odin test .<CR>", opts)
		vim.keymap.set("n", "<leader>oc", ":!odin check .<CR>", opts)
	end,
})
