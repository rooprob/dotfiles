vim.api.nvim_create_autocmd("FileType", {
	pattern = "nix",
	callback = function()
		local opts = { buffer = true, silent = true }
		vim.keymap.set("n", "<leader>ne", ":!nix eval .#<Left>", opts)
		vim.keymap.set("n", "<leader>nf", ":!nix flake check<CR>", opts)
	end,
})
