return {
    "nvim-neo-tree/neo-tree.nvim",
    ft = 'netrw',
    cmd = 'Neotree',
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",
    },
    -- https://github.com/nvim-neo-tree/neo-tree.nvim/issues/1247
    config = function()
        require'neo-tree'.setup{
            filesytem = {
                hijack_netrw_behavior = 'open_current'
            }
        }
        if vim.bo.filetype == 'netrw' and vim.b.netrw_method == nil then
            vim.defer_fn(function()
                vim.cmd('enew | Neotree current dir=' .. vim.b.netrw_curdir)
            end, 0)
        end
    end
}
