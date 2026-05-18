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
		automatic_enable = false,
	})
end)
