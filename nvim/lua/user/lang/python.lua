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
		vim.keymap.set("n", "<leader>pr", ":!python %<CR>", opts)
		vim.keymap.set("n", "<leader>pt", ":!pytest<CR>", opts)
		vim.keymap.set("n", "<leader>pm", ":!python -m ", opts)
		vim.keymap.set("n", "<leader>pi", ":!ipython<CR>", opts)
	end,
})
