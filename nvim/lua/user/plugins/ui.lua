pcall(function()
	require("lualine").setup({
		options = {
			theme = "auto",
			globalstatus = true,
			section_separators = "",
			component_separators = "",
		},
	})
end)

pcall(function()
	require("gitsigns").setup({
		signs = {
			add = { text = "+" },
			change = { text = "~" },
			delete = { text = "_" },
			topdelete = { text = "‾" },
			changedelete = { text = "~" },
		},
	})
end)

pcall(function()
	require("nvim-tree").setup({
		view = {
			width = 30,
		},
		renderer = {
			group_empty = true,
		},
	})

	vim.api.nvim_create_autocmd("VimEnter", {
		group = vim.api.nvim_create_augroup("UserNvimTreeStart", { clear = true }),
		callback = function(data)
			local path = data.file
			local stat = path ~= "" and vim.uv.fs_stat(path) or nil

			if stat and stat.type == "file" then
				require("nvim-tree.api").tree.open()
				return
			end

			require("nvim-tree.api").tree.open({ path = path ~= "" and path or vim.uv.cwd() })
		end,
	})
end)

pcall(function()
	require("which-key").setup()
end)

pcall(function()
	require("ibl").setup()
end)
