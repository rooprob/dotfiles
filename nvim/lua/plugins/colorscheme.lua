return { 
    -- the colorscheme should be available when starting Neovim
    { "fenetikm/falcon", 
        lazy = false, 
        priority = 1000,

        config = function()
            vim.cmd("colorscheme falcon")
            vim.cmd("set termguicolors")
        end
    }
}

