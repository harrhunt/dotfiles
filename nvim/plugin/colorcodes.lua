vim.pack.add({
    'https://github.com/eero-lehtinen/oklch-color-picker.nvim'
})

vim.keymap.set("n", "<Leader>vc", function() require("oklch-color-picker").pick_under_cursor() end)
require("oklch-color-picker").setup()
