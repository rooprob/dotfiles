local lsp = require("user.lsp")

lsp.setup("gopls", {
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
				shadow = true,
			},
			staticcheck = true,
			gofumpt = true,
		},
	},
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "go",
	callback = function()
		local opts = { buffer = true, silent = true }
		vim.keymap.set("n", "<leader>gt", ":!go test ./...<CR>", vim.tbl_extend("force", opts, { desc = "Go test" }))
		vim.keymap.set("n", "<leader>gr", ":!go run .<CR>", vim.tbl_extend("force", opts, { desc = "Go run" }))
		vim.keymap.set("n", "<leader>gb", ":!go build .<CR>", vim.tbl_extend("force", opts, { desc = "Go build" }))
		vim.keymap.set("n", "<leader>gm", ":!go mod tidy<CR>", vim.tbl_extend("force", opts, { desc = "Go mod tidy" }))
	end,
})
