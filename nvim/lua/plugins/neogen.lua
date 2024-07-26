return {
    "danymat/neogen",
    config = function()
        require("neogen").setup({
            enabled = true,
            snippet_engine = "luasnip",
            languages = {
                python = {
                    template = {
                        annotation_convention = "numpydoc",
                    },
                },
            },
        })
        local opts = { noremap = true, silent = true }
        vim.api.nvim_set_keymap("n", "<Leader>nf", ":lua require('neogen').generate()<CR>", opts)
    end,
}
