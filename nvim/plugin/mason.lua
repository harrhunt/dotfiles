vim.pack.add({
    { src = "https://github.com/mason-org/mason.nvim" },
})

vim.keymap.set("n", "<leader>mm", "<cmd>Mason<CR>")

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
        },
    },
})
