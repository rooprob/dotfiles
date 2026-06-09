# Neovim

Local Neovim config managed from dotfiles and linked by Home Manager.

Nix installs Neovim, LSPs, formatters, and linters. This directory owns editor
behavior, mappings, plugin setup, and the custom theme.

## Layout

- `init.lua` - entrypoint
- `lua/user/lazy.lua` - plugin bootstrap and plugin specs
- `lua/user/core/` - options and keymaps
- `lua/user/themes/dracowl.lua` - custom DracOwl theme overlays
- `lua/user/plugins/` - Treesitter, completion, Telescope, UI, formatting
- `lua/user/lsp/` - shared LSP setup
- `lua/user/lang/` - language-specific config

## Python

Python uses:

- `pyright` for type-aware language support
- `ruff` LSP for diagnostics/code actions
- `ruff_format` and `ruff_organize_imports` through conform
- `ruff` and `mypy` through nvim-lint

## Node

Node/TypeScript uses:

- `ts_ls` for TypeScript and JavaScript language support
- `eslint` LSP for diagnostics, code actions, and fix-all on save
- `prettier` through conform for formatting

## Finding

Primary search mappings:

- `<leader><space>` finds files, including hidden files while respecting ignores
- `<leader>/` ripgreps project text, including hidden files while skipping build output
- `<leader>,` switches buffers, sorted by most recently used
- `<leader>bb` switches buffers, sorted by most recently used
- `<leader>ba` jumps to the alternate buffer
- `<leader><Tab>` also jumps to the alternate buffer
- `<leader>bk` deletes the current buffer without quitting the window
- `]b` and `[b` move to next/previous buffers
- `<leader>fr` opens recent files
- `<leader>bd` deletes the current buffer without quitting the window

Which-key groups leader mappings into `buffers`, `find`, `diagnostics`, and
language-specific groups so the `<space>` popup is scannable.

## Mason

Mason is available with `:Mason` for ad hoc tools. The TypeScript and ESLint
language servers are ensured through Mason. Core formatters and linters still
come from Nix.

## Nix Boundary

Keep Neovim, LSP, formatter, and linter binaries in `~/System/nix-darwin-config`.
Keep Neovim plugins and behavior here.
