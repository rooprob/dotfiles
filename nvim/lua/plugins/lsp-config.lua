return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },

    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "bashls",
                    "clangd",
                    "eslint",
                    "gopls",
                    "gradle_ls",
                    "jsonls",
                    "jdtls",
                    "tsserver",
                    "marksman",
                    "ruff_lsp",
                    "pyright",
                    "yamlls"

                }
            })

        end
    },
    {"neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require('lspconfig')
            lspconfig.bashls.setup({ })
            lspconfig.clangd.setup({ })
            lspconfig.eslint.setup({ })
            lspconfig.gopls.setup({ })
            lspconfig.gradle_ls.setup({ })
            lspconfig.jdtls.setup({ })
            lspconfig.lua_ls.setup({ })
            lspconfig.marksman.setup({ })
            lspconfig.pyright.setup({ })
            lspconfig.ruff_lsp.setup({ })
            lspconfig.tsserver.setup({ })
            lspconfig.yamlls.setup({ })

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set({'n','v'}, '<leader>ca', vim.lsp.buf.code_action, {})
        end
    }
}
