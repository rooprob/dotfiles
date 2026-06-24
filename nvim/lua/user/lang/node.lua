local node_ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue" }

return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				ts_ls = { filetypes = node_ft },
				eslint = {
					filetypes = node_ft,
					settings = { workingDirectories = { mode = "auto" } },
				},
			},
		},
		init = function()
			-- EslintFixAll on save
			vim.api.nvim_create_autocmd("LspAttach", {
				callback = function(ev)
					local client = vim.lsp.get_client_by_id(ev.data.client_id)
					if client and client.name == "eslint" then
						vim.api.nvim_create_autocmd("BufWritePre", {
							buffer = ev.buf,
							callback = function() vim.cmd("silent! EslintFixAll") end,
						})
					end
				end,
			})
			vim.api.nvim_create_autocmd("FileType", {
				pattern = node_ft,
				callback = function()
					local opts = { buffer = true, silent = true }
					vim.keymap.set("n", "<leader>nr", ":!npm run ", vim.tbl_extend("force", opts, { desc = "Npm run" }))
					vim.keymap.set("n", "<leader>nt", ":!npm test<CR>", vim.tbl_extend("force", opts, { desc = "Npm test" }))
					vim.keymap.set("n", "<leader>nl", ":!npm run lint<CR>", vim.tbl_extend("force", opts, { desc = "Npm lint" }))
					vim.keymap.set("n", "<leader>nf", ":!npm run format<CR>", vim.tbl_extend("force", opts, { desc = "Npm format" }))
				end,
			})
		end,
	},
}
