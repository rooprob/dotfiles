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

	local group = vim.api.nvim_create_augroup("UserNvimTree", { clear = true })

	vim.api.nvim_create_autocmd("VimEnter", {
		group = group,
		callback = function(data)
			local path = data.file
			local stat = path ~= "" and vim.uv.fs_stat(path) or nil

			-- Only open nvim-tree if no file was specified or if opening a directory
			if not stat or stat.type == "directory" then
				require("nvim-tree.api").tree.open({ path = path ~= "" and path or vim.uv.cwd() })
				-- Return focus to the main window so pickers (telescope etc.) open
				-- files there instead of creating spurious No Name buffers.
				vim.cmd("wincmd p")
			end
		end,
	})

	-- Quit nvim if nvim-tree is the last remaining window
	vim.api.nvim_create_autocmd("BufEnter", {
		group = group,
		pattern = "NvimTree*",
		callback = function()
			-- Schedule so Telescope (and other pickers) have time to open
			-- their target buffer before we count real windows.
			vim.schedule(function()
				local wins = vim.api.nvim_list_wins()
				local real_wins = 0
				for _, win in ipairs(wins) do
					local buf = vim.api.nvim_win_get_buf(win)
					local ft = vim.api.nvim_get_option_value("filetype", { buf = buf })
					if ft ~= "NvimTree" then
						real_wins = real_wins + 1
					end
				end

				if real_wins == 0 then
					vim.cmd("quit")
				end
			end)
		end,
	})
end)

pcall(function()
	local wk = require("which-key")

	wk.setup()

	local groups = {
		{ "<leader>b", group = "buffers" },
		{ "<leader>c", group = "code" },
		{ "<leader>f", group = "find" },
		{ "<leader>g", group = "go" },
		{ "<leader>n", group = "node/nix" },
		{ "<leader>o", group = "odin" },
		{ "<leader>p", group = "python" },
		{ "<leader>r", group = "rename" },
		{ "<leader>x", group = "diagnostics" },
	}

	if type(wk.add) == "function" then
		wk.add(groups)
	else
		wk.register({
			b = { name = "buffers" },
			c = { name = "code" },
			f = { name = "find" },
			g = { name = "go" },
			n = { name = "node/nix" },
			o = { name = "odin" },
			p = { name = "python" },
			r = { name = "rename" },
			x = { name = "diagnostics" },
		}, { prefix = "<leader>" })
	end
end)

pcall(function()
	require("ibl").setup()
end)
