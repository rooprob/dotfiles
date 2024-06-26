require("rooprob.set")
require("rooprob.remap")
require("rooprob.lazy_init")

local augroup = vim.api.nvim_create_augroup
local RooprobGroup = augroup("Rooprob", {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup("HighlightYank", {})

function R(name)
    require("plenary.reload").reload_module(name)
end

vim.filetype.add({
    extension = {
        templ = "templ",
    }
})

autocmd("TextYankPost", {
    group = yank_group,
    pattern = "*",
    callback = function ()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
        })
    end,
})

autocmd({ "BufWritePre" }, {
    group = RooprobGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd({ "BufWritePost" }, {
    group = RooprobGroup,
    pattern = "*",
    desc = "Auto-format files after saving",
    callback = function ()
        vim.lsp.buf.format()
    end
})

autocmd("LspAttach", {
    group = RooprobGroup,
    callback = function (e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function () vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function () vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function () vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function () vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "<leader>vca", function () vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function () vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function () vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function () vim.lsp.buf.signature_help() end, opts)
        vim.keymap.set("n", "[d", function () vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function () vim.diagnostic.goto_prev() end, opts)
    end
})
