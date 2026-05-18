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

## Mason

Mason is available with `:Mason` for ad hoc tools. Core LSPs, formatters, and
linters still come from Nix.

## Nix Boundary

Keep Neovim, LSP, formatter, and linter binaries in `~/System/nix-darwin-config`.
Keep Neovim plugins and behavior here.
