-- Adds <leader>fm as an extra format shortcut; LazyVim provides gd, K, gr,
-- <leader>ca, <leader>cr, <leader>cf by default.
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspAttach", {}),
	callback = function(ev)
		vim.keymap.set("n", "<leader>fm", function()
			vim.lsp.buf.format({ async = true })
		end, { buffer = ev.buf, desc = "Format buffer" })
	end,
})

return {
	{
		"neovim/nvim-lspconfig",
		opts = {
			servers = {
				bashls = {},
				yamlls = {},
				taplo = {},
				jsonls = {},
				lua_ls = {
					settings = {
						Lua = {
							diagnostics = { globals = { "vim" } },
							workspace = {
								library = vim.api.nvim_get_runtime_file("", true),
								checkThirdParty = false,
							},
							telemetry = { enable = false },
						},
					},
				},
			},
		},
	},
}
