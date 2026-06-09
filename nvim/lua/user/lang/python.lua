local lsp = require("user.lsp")

lsp.setup("pyright", {
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "basic",
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "workspace",
			},
		},
	},
})

lsp.setup("ruff", {
	init_options = {
		settings = {
			args = {},
		},
	},
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		local opts = { buffer = true, silent = true }
		vim.opt_local.tabstop = 4
		vim.opt_local.shiftwidth = 4
		vim.opt_local.expandtab = true
		vim.keymap.set("n", "<leader>pr", ":!python %<CR>", vim.tbl_extend("force", opts, { desc = "Python run file" }))
		vim.keymap.set("n", "<leader>pt", ":!pytest<CR>", vim.tbl_extend("force", opts, { desc = "Pytest" }))
		vim.keymap.set("n", "<leader>pm", ":!python -m ", vim.tbl_extend("force", opts, { desc = "Python module" }))
		vim.keymap.set("n", "<leader>pi", ":!ipython<CR>", vim.tbl_extend("force", opts, { desc = "IPython" }))
	end,
})
