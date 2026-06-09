local lsp = require("user.lsp")

local node_filetypes = {
	"javascript",
	"javascriptreact",
	"typescript",
	"typescriptreact",
	"vue",
}

lsp.setup("ts_ls", {
	filetypes = node_filetypes,
})

lsp.setup("eslint", {
	filetypes = node_filetypes,
	settings = {
		workingDirectories = { mode = "auto" },
	},
	on_attach = function(_, bufnr)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			callback = function()
				vim.cmd("silent! EslintFixAll")
			end,
		})
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = node_filetypes,
	callback = function()
		local opts = { buffer = true, silent = true }
		vim.opt_local.tabstop = 2
		vim.opt_local.shiftwidth = 2
		vim.opt_local.softtabstop = 2
		vim.opt_local.expandtab = true
		vim.keymap.set("n", "<leader>nr", ":!npm run ", vim.tbl_extend("force", opts, { desc = "Npm run" }))
		vim.keymap.set("n", "<leader>nt", ":!npm test<CR>", vim.tbl_extend("force", opts, { desc = "Npm test" }))
		vim.keymap.set("n", "<leader>nl", ":!npm run lint<CR>", vim.tbl_extend("force", opts, { desc = "Npm lint" }))
		vim.keymap.set("n", "<leader>nf", ":!npm run format<CR>", vim.tbl_extend("force", opts, { desc = "Npm format" }))
	end,
})
