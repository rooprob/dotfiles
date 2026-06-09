local ok_conform, conform = pcall(require, "conform")
if ok_conform then
	conform.setup({
		formatters_by_ft = {
			lua = { "stylua" },
			nix = { "nixfmt" },
			sh = { "shfmt" },
			bash = { "shfmt" },
			json = { "prettier" },
			jsonc = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			scss = { "prettier" },
			javascript = { "prettier" },
			javascriptreact = { "prettier" },
			typescript = { "prettier" },
			typescriptreact = { "prettier" },
			vue = { "prettier" },
			svelte = { "prettier" },
			astro = { "prettier" },
			python = { "ruff_format", "ruff_organize_imports" },
			go = { "gofumpt", "goimports" },
		},
		formatters = {
			prettier = {
				prepend_args = { "--print-width", "120" },
			},
		},
		format_on_save = {
			timeout_ms = 500,
			lsp_format = "fallback",
		},
	})
end

local ok_lint, lint = pcall(require, "lint")
if ok_lint then
	lint.linters_by_ft = {
		nix = { "statix" },
		sh = { "shellcheck" },
		bash = { "shellcheck" },
		python = { "ruff", "mypy" },
		go = { "golangcilint" },
	}

	vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
		callback = function()
			require("lint").try_lint()
		end,
	})
end
