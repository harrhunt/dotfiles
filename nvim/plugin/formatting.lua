vim.pack.add({ "https://github.com/stevearc/conform.nvim.git" })

require("conform").setup({
    formatters_by_ft = {
        json = { "jq" },
    },
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = { "json" },
    callback = function(args)
        local bufnr = args.buf
        vim.keymap.set("n", "<leader>vf",
            function()
                require("conform").format({ bufnr = bufnr, async = true, lsp_format = "fallback" })
            end,
            { buffer = bufnr, desc = "Conform Format" })
    end,
})
