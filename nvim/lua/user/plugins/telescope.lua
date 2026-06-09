local ok, telescope = pcall(require, "telescope")
if not ok then
	return
end

telescope.setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
			"--glob",
			"!**/.git/*",
			"--glob",
			"!**/node_modules/*",
			"--glob",
			"!**/dist/*",
			"--glob",
			"!**/build/*",
			"--glob",
			"!**/.next/*",
		},
		mappings = {
			i = {
				["<C-u>"] = false,
				["<C-d>"] = false,
			},
		},
	},
})

pcall(telescope.load_extension, "fzf")

local builtin = require("telescope.builtin")
local map = vim.keymap.set

local function find_files()
	builtin.find_files({
		hidden = true,
		no_ignore = false,
	})
end

local function live_grep()
	builtin.live_grep({
		additional_args = {
			"--hidden",
			"--glob",
			"!**/.git/*",
			"--glob",
			"!**/node_modules/*",
			"--glob",
			"!**/dist/*",
			"--glob",
			"!**/build/*",
			"--glob",
			"!**/.next/*",
		},
	})
end

local function buffers()
	builtin.buffers({
		sort_mru = true,
		ignore_current_buffer = true,
	})
end

map("n", "<leader><space>", find_files, { desc = "Find files" })
map("n", "<leader>/", live_grep, { desc = "Live grep" })
map("n", "<leader>,", buffers, { desc = "Buffers" })
map("n", "<leader>ff", find_files, { desc = "Find files" })
map("n", "<leader>fg", live_grep, { desc = "Live grep" })
map("n", "<leader>fb", buffers, { desc = "Buffers" })
map("n", "<leader>fr", builtin.oldfiles, { desc = "Recent files" })
map("n", "<leader>fw", builtin.grep_string, { desc = "Grep word" })
map("n", "<leader>fc", builtin.commands, { desc = "Commands" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Help tags" })
