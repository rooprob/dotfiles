vim.api.nvim_create_autocmd("FileType", {
	pattern = "nix",
	callback = function()
		local opts = { buffer = true, silent = true }
		vim.keymap.set("n", "<leader>ne", ":!nix eval .#<Left>", vim.tbl_extend("force", opts, { desc = "Nix eval" }))
		vim.keymap.set("n", "<leader>nf", ":!nix flake check<CR>", vim.tbl_extend("force", opts, { desc = "Nix flake check" }))
	end,
})
