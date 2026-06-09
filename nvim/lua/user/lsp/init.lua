local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_ok, cmp_lsp = pcall(require, "cmp_nvim_lsp")
if cmp_ok then
	capabilities = cmp_lsp.default_capabilities(capabilities)
end

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf }
		vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
		vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
		vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Rename symbol" }))
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code action" }))
		vim.keymap.set("n", "<leader>f", function()
			vim.lsp.buf.format({ async = true })
		end, vim.tbl_extend("force", opts, { desc = "Format buffer" }))
	end,
})

local function setup(server, opts)
	opts = opts or {}
	opts.capabilities = capabilities

	if vim.lsp.config and vim.lsp.enable then
		vim.lsp.config(server, opts)
		vim.lsp.enable(server)
		return
	end

	local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
	if lspconfig_ok and lspconfig[server] then
		lspconfig[server].setup(opts)
	end
end

setup("nixd")
setup("nil_ls")
setup("bashls")
setup("yamlls")
setup("taplo")
setup("jsonls")
setup("marksman")
setup("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
			telemetry = {
				enable = false,
			},
		},
	},
})

return {
	setup = setup,
	capabilities = capabilities,
}
