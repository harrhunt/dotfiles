-- vim.pack.add({ "https://github.com/rose-pine/neovim" })
-- vim.pack.add({ "https://github.com/rakr/vim-one" })
-- vim.pack.add({ "https://github.com/vague-theme/vague.nvim" })
vim.pack.add({ "https://github.com/rebelot/kanagawa.nvim" })

require("kanagawa").setup({
    compile = true,
    theme = "dragon",
    background = {
        dark = "dragon",
        light = "lotus",
    },
})
vim.cmd.colorscheme("kanagawa")
-- vim.cmd.colorscheme("vague")
-- vim.cmd.colorscheme("rose-pine")
-- vim.cmd.colorscheme("one")
