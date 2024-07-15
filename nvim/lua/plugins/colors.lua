return {
    "ellisonleao/gruvbox.nvim",
    name = "gruvbox",
    lazy = false,
    config = function()
        require("gruvbox").setup({
            terminal_colors = true, -- add neovim terminal colors
            undercurl = true,
            underline = true,
            bold = true,
            italic = {
                strings = true,
                emphasis = true,
                comments = true,
                operators = false,
                folds = true,
            },
            strikethrough = true,
            invert_selection = false,
            invert_signs = false,
            invert_tabline = false,
            invert_intend_guides = false,
            inverse = true, -- invert background for search, diffs, statuslines and errors
            contrast = "",  -- can be "hard", "soft" or empty string
            palette_overrides = {
                dark0 = "#222222",
                dark1 = "#282828",
                dark2 = "#383838",
                dark3 = "#383838",
                dark4 = "#383838",
                gray = "#504945",
            },
            overrides = {
                Visual = { bg = "#383838" },
            },
            dim_inactive = false,
            transparent_mode = false,
        })
        vim.cmd("colorscheme gruvbox")
    end,
}
