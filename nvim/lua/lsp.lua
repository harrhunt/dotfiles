local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

local geodmangroup = augroup('geodman', {})

vim.diagnostic.config({ jump = { float = true } })

autocmd('LspAttach', {
    group = geodmangroup,
    callback = function(e)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = e.buf, desc = "Go to definition" })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = e.buf, desc = "Hover" })
        vim.keymap.set("n", "<leader>vf", function() vim.lsp.buf.format({ async = true }) end,
            { buffer = e.buf, desc = "Format buffer" })
        vim.keymap.set("n", "<leader>vg", vim.lsp.buf.code_action, { buffer = e.buf, desc = "Code actions" })
        vim.keymap.set("n", "<leader>vrn", vim.lsp.buf.rename, { buffer = e.buf, desc = "Rename" })
        vim.keymap.set("n", "<leader>vrr", vim.lsp.buf.references, { buffer = e.buf, desc = "References" })
        vim.keymap.set("n", "<C-h>", vim.lsp.buf.signature_help, { buffer = e.buf, desc = "Signature help" })
        vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = 1 }) end,
            { buffer = e.buf, desc = "Next diagnostic" })
        vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = -1 }) end,
            { buffer = e.buf, desc = "Previous diagnostic" })
        vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, { buffer = e.buf, desc = "Workspace symbol" })
        vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float,
            { buffer = e.buf, desc = "Open diagnostic float window" })
    end,
})

vim.diagnostic.config({ virtual_text = true })

vim.lsp.enable({
    "lua_ls",
    "tinymist",
    "bashls",
    "clangd",
    "zls",
    "ruff",
    "ty",
    "svelte",
    "gopls",
})
