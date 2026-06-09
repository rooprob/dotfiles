local ok, mason = pcall(require, "mason")
if not ok then
	return
end

mason.setup({
	ui = {
		border = "rounded",
	},
})

pcall(function()
	require("mason-lspconfig").setup({
		ensure_installed = {
			"eslint",
			"ts_ls",
		},
		automatic_enable = false,
	})
end)
