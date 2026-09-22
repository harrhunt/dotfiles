vim.pack.add({ "https://github.com/stevearc/conform.nvim.git" })

require("conform").setup({
    formatters_by_ft = {
        json = { "jq" },
        nginx = { "nginxfmt" },
    },
})

vim.api.nvim_create_autocmd('FileType', {
    pattern = { "json", "nginx" },
    callback = function(args)
        local bufnr = args.buf
        vim.keymap.set("n", "<leader>vfc",
            function()
                require("conform").format({ bufnr = bufnr, async = true, lsp_format = "fallback" })
            end,
            { buffer = bufnr, desc = "Conform Format" })
    end,
})
