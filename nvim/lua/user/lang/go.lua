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
		vim.keymap.set("n", "<leader>gt", ":!go test ./...<CR>", opts)
		vim.keymap.set("n", "<leader>gr", ":!go run .<CR>", opts)
		vim.keymap.set("n", "<leader>gb", ":!go build .<CR>", opts)
		vim.keymap.set("n", "<leader>gm", ":!go mod tidy<CR>", opts)
	end,
})
