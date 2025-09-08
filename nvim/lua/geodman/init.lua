require("geodman.set")
require("geodman.remap")

local augroup = vim.api.nvim_create_augroup
local geodmangroup = augroup('geodman', {})

local autocmd = vim.api.nvim_create_autocmd

autocmd('LspAttach', {
    group = geodmangroup,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>vf", function() vim.lsp.buf.format({ async = true }) end, opts)
        vim.keymap.set("n", "<leader>vg", vim.lsp.buf.code_action, opts)
        vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, opts)
        vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<C-h>", vim.lsp.buf.signature_help, opts)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
        vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
        vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
    end,
})

vim.lsp.enable({
    "biome",
    "lua_ls",
    "ruff",
    "pylsp",
    "taplo",
    "ts_ls",
    "zls",
    "tinymist",
    "cssls",
})
