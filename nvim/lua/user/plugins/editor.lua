return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		keys = {
			{ "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "File tree" },
			{ "<C-n>", "<cmd>NvimTreeToggle<CR>", desc = "File tree" },
		},
		opts = {
			view = { width = 30 },
			renderer = { group_empty = true },
		},
		config = function(_, opts)
			require("nvim-tree").setup(opts)

			local group = vim.api.nvim_create_augroup("UserNvimTree", { clear = true })

			vim.api.nvim_create_autocmd("VimEnter", {
				group = group,
				callback = function(data)
					local path = data.file
					local stat = path ~= "" and vim.uv.fs_stat(path) or nil
					if not stat or stat.type == "directory" then
						require("nvim-tree.api").tree.open({ path = path ~= "" and path or vim.uv.cwd() })
						vim.cmd("wincmd p")
					end
				end,
			})

			vim.api.nvim_create_autocmd("WinClosed", {
				group = group,
				callback = function()
					vim.schedule(function()
						local wins = vim.api.nvim_list_wins()
						local real_wins = 0
						for _, win in ipairs(wins) do
							local cfg = vim.api.nvim_win_get_config(win)
							if cfg.relative ~= "" then goto continue end
							local buf = vim.api.nvim_win_get_buf(win)
							local ft = vim.api.nvim_get_option_value("filetype", { buf = buf })
							if ft ~= "NvimTree" then real_wins = real_wins + 1 end
							::continue::
						end
						if real_wins == 0 then vim.cmd("quit") end
					end)
				end,
			})
		end,
	},
	{ "christoomey/vim-tmux-navigator", lazy = false },
	{ "tpope/vim-fugitive", cmd = { "Git", "G" } },
}
