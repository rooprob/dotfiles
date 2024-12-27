return {

    -- Plenary is a Lua module for asynchronous programming using coroutines. The libary is built on native lua coroutines and libuv.
    {
        "nvim-lua/plenary.nvim",
        name = "plenary",
    },

    
    {
        "nvchad/base46",
        build = function()
            require("base46").load_all_highlights()
        end,
    },


    {
        "nvchad/ui",
        lazy = false,
        config = function()
            require "nvchad"
        end,
    },
    
    -- Provides fuzzy finder over lists. 
    -- <leader>ff  find files
    -- <leader>fw  find word in a live grep
    -- <leader>fb  find buffer 
    -- <leader>fh  find help
    -- <leader>ma  find marks 
    -- <leader>cm  git commits
    -- <leader>gt  git status
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        cmd = "Telescope",
        opts = {
            defaults = {
                prompt_prefix = "   ",
                selection_caret = " ",
                entry_prefix = " ",
                sorting_strategy = "ascending",
                layout_config = {
                    horizontal = {
                        prompt_position = "top",
                        preview_width = 0.55,
                    },
                    width = 0.87,
                    height = 0.80,
                },
                mappings = {
                        n = { ["q"] = require("telescope.actions").close },
                },
            },

            extensions_list = { "themes", "terms" },
            extensions = {},
        }
    },

    -- file managing , picker etc
    -- <leader>e to open with focus NvTreeToggle
    -- C-n to NvTreeToggle
    {
        "nvim-tree/nvim-tree.lua",
        cmd = { "NvimTreeToggle", "NvimTreeFocus" },
        opts = {
            filters = { dotfiles = false },
            disable_netrw = true,
            hijack_cursor = true,
            sync_root_with_cwd = true,
            update_focused_file = {
                enable = true,
                update_root = false,
            },
            view = {
                width = 30,
                preserve_window_proportions = true,
            },
            renderer = {
                root_folder_label = false,
                highlight_git = true,
                indent_markers = { enable = true },
                icons = {
                    glyphs = {
                        default = "󰈚",
                        folder = {
                            default = "",
                            empty = "",
                            empty_open = "",
                            open = "",
                            symlink = "",
                        },
                        git = { unmerged = "" },
                    },
                },
            },

        }
    },


    -- Provides a fun visualization
    -- :CellularAutomaton make_it_rain, game_of_life, scramble
    "eandrju/cellular-automaton.nvim",

    -- Provides a helpful reminder for your keymaps.
    -- integrated with leader
    -- :checkhealth which-key
    -- <leader>wK "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" }
    -- <leader>wk function()
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
            -- refer to the configuration section below
        },
    },
    -- Provides Nerd font icons  for use by neovim plugins
    -- :NvimWebDeviconsHiTest
    {
        "nvim-tree/nvim-web-devicons",
        opts = function()
        end,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        event = "User FilePost",
        opts = {
            indent = { char = "│", highlight = "IblChar" },
            scope = { char = "│", highlight = "IblScopeChar" },
        },
        config = function(_, opts)
            local hooks = require "ibl.hooks"
            hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
            require("ibl").setup(opts)
        end,
    },

    -- git stuff
    -- Proivdes git decorations and integration with buffers
    -- async with luv
    -- git blame, hunk actions
    {
        "lewis6991/gitsigns.nvim",
        event = "User FilePost",
        opts = {
            signs = {
                delete = { text = "󰍵" },
                changedelete = { text = "󱕖" },
            },
        }
    },

    -- formatting!
    -- Provides lightweight powerful formatter
    {
        "stevearc/conform.nvim",
        opts = {
            format_on_save = {
                -- I recommend these options. See :help conform.format for details.
                lsp_format = "fallback",
                timeout_ms = 500,
            },
            -- If this is set, Conform will run the formatter asynchronously after save.
            -- It will pass the table to conform.format().
            -- This can also be a function that returns the table.
            format_after_save = {
                lsp_format = "fallback",
            },
            formatters_by_ft = {
                lua = { "stylua" },
                -- Conform will run multiple formatters sequentially
                go = { "goimports", "gofmt" },
                python = function(bufnr)
                    if require("conform").get_formatter_info("ruff_format", bufnr).available then
                        return { "ruff_format" }
                    else
                        return { "isort", "black" }
                    end
                end,
                -- You can customize some of the format options for the filetype (:help conform.format)
                rust = { "rustfmt", lsp_format = "fallback" },
                -- Conform will run the first available formatter
                javascript = { "prettierd", "prettier", stop_after_first = true },
                -- Use the "*" filetype to run formatters on all filetypes.
                ["*"] = { "codespell" },
                -- Use the "_" filetype to run formatters on filetypes that don't
                -- have other formatters configured.
                ["_"] = { "trim_whitespace" },
            },
        },
    },

    -- Provides AST for syntax highlighting 
    --
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPost", "BufNewFile" },
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        build = ":TSUpdate",
        opts = {
            ensure_installed = { "lua", "luadoc", "printf", "vim", "vimdoc" },

            highlight = {
                enable = true,
                use_languagetree = true,
            },

            indent = { enable = true },
        },
        config = function(_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end,
    },

    -- load luasnips + cmp related in insert mode only
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            {
                -- snippet plugin
                "L3MON4D3/LuaSnip",
                dependencies = "rafamadriz/friendly-snippets",
                opts = { history = true, updateevents = "TextChanged,TextChangedI" },
                config = function(_, opts)
                    require("luasnip").config.set_config(opts)
                    -- vscode format
                    require("luasnip.loaders.from_vscode").lazy_load { exclude = vim.g.vscode_snippets_exclude or {} }
                    require("luasnip.loaders.from_vscode").lazy_load { paths = vim.g.vscode_snippets_path or "" }

                    -- snipmate format
                    require("luasnip.loaders.from_snipmate").load()
                    require("luasnip.loaders.from_snipmate").lazy_load { paths = vim.g.snipmate_snippets_path or "" }

                    -- lua format
                    require("luasnip.loaders.from_lua").load()
                    require("luasnip.loaders.from_lua").lazy_load { paths = vim.g.lua_snippets_path or "" }

                    vim.api.nvim_create_autocmd("InsertLeave", {
                        callback = function()
                            if
                                require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
                                and not require("luasnip").session.jump_active
                            then
                                require("luasnip").unlink_current()
                            end
                        end,
                    })
                end,
            },

            -- autopairing of (){}[] etc
            {
                "windwp/nvim-autopairs",
                opts = {
                    fast_wrap = {},
                    disable_filetype = { "TelescopePrompt", "vim" },
                },
                config = function(_, opts)
                    require("nvim-autopairs").setup(opts)

                    -- setup cmp for autopairs
                    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
                    require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
                end,
            },

            -- cmp sources plugins
            {
                "saadparwaiz1/cmp_luasnip",
                "hrsh7th/cmp-nvim-lua",
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
            },
        },
        opts = function()
            return require "rooprob.configs.cmp"
        end,
    },


    -- lsp stuff
    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
        opts = {

            PATH = "skip",

            ui = {
                icons = {
                    package_pending = " ",
                    package_installed = " ",
                    package_uninstalled = " ",
                },
            },

            max_concurrent_installers = 10,
        }
    },
    {
        "neovim/nvim-lspconfig",
        event = "User FilePost",
        config = function()
            require("rooprob.configs.lspconfig").defaults()
            local lspconfig = require("lspconfig")

            local servers = { "html", "cssls", "ruff", "yamlls", "marksman", "lua_ls" }
            local nvlsp = require("rooprob.configs.lspconfig")

            -- lsps with default config
            for _, lsp in ipairs(servers) do
                lspconfig[lsp].setup({
                    on_attach = nvlsp.on_attach,
                    on_init = nvlsp.on_init,
                    capabilities = nvlsp.capabilities,
                })
            end

            -- configuring single server, example: typescript
            -- lspconfig.ts_ls.setup {
            --   on_attach = nvlsp.on_attach,
            --   on_init = nvlsp.on_init,
            --   capabilities = nvlsp.capabilities,
            -- }
            lspconfig.lua_ls.setup({
                on_init = function(client)
                    if client.workspace_folders then
                        local path = client.workspace_folders[1].name
                        if vim.loop.fs_stat(path .. "/.luarc.json") or vim.loop.fs_stat(path .. "/.luarc.jsonc") then
                            return
                        end
                    end

                    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
                        runtime = {
                            -- Tell the language server which version of Lua you're using
                            -- (most likely LuaJIT in the case of Neovim)
                            version = "LuaJIT",
                        },
                        -- Make the server aware of Neovim runtime files
                        workspace = {
                            checkThirdParty = false,
                            library = {
                                vim.env.VIMRUNTIME,
                                -- Depending on the usage, you might want to add additional paths here.
                                -- "${3rd}/luv/library"
                                -- "${3rd}/busted/library",
                            },
                            -- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
                            -- library = vim.api.nvim_get_runtime_file("", true)
                        },
                    })
                end,
                settings = {
                    Lua = {},
                },
            })

        end,
    },
}
