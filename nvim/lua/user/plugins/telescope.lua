return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		opts = function(_, opts)
			local actions = require("telescope.actions")
			opts.defaults = vim.tbl_deep_extend("force", opts.defaults or {}, {
				vimgrep_arguments = {
					"rg", "--color=never", "--no-heading", "--with-filename",
					"--line-number", "--column", "--smart-case", "--hidden",
					"--glob", "!**/.git/*", "--glob", "!**/node_modules/*",
					"--glob", "!**/dist/*", "--glob", "!**/build/*", "--glob", "!**/.next/*",
				},
				mappings = {
					i = {
						["<C-j>"] = actions.move_selection_next,
						["<C-k>"] = actions.move_selection_previous,
						["<C-n>"] = actions.move_selection_next,
						["<C-p>"] = actions.move_selection_previous,
						["<Tab>"] = actions.move_selection_next,
						["<S-Tab>"] = actions.move_selection_previous,
						["<C-f>"] = actions.preview_scrolling_down,
						["<C-b>"] = actions.preview_scrolling_up,
					},
					n = {
						["j"] = actions.move_selection_next,
						["k"] = actions.move_selection_previous,
						["<C-f>"] = actions.preview_scrolling_down,
						["<C-b>"] = actions.preview_scrolling_up,
					},
				},
			})
			return opts
		end,
		keys = {
			{ "<leader><space>", function() require("telescope.builtin").find_files({ hidden = true }) end, desc = "Find files" },
			{ "<leader>/", function()
				require("telescope.builtin").live_grep({ additional_args = {
					"--hidden", "--glob", "!**/.git/*", "--glob", "!**/node_modules/*",
				}})
			end, desc = "Live grep" },
			{ "<leader>,", function() require("telescope.builtin").buffers({ sort_mru = true, ignore_current_buffer = true }) end, desc = "Buffers" },
			{ "<leader>ff", function() require("telescope.builtin").find_files({ hidden = true }) end, desc = "Find files" },
			{ "<leader>fg", function() require("telescope.builtin").live_grep() end, desc = "Live grep" },
			{ "<leader>fb", function() require("telescope.builtin").buffers({ sort_mru = true, ignore_current_buffer = true }) end, desc = "Buffers" },
			{ "<leader>fr", function() require("telescope.builtin").oldfiles() end, desc = "Recent files" },
			{ "<leader>fw", function() require("telescope.builtin").grep_string() end, desc = "Grep word" },
			{ "<leader>fc", function() require("telescope.builtin").commands() end, desc = "Commands" },
			{ "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Help tags" },
		},
	},
}
