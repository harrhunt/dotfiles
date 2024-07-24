return {
    {
        "srcery-colors/srcery-vim",
        lazy = false,
        name = "srcery",
        config = function()
            -- require("srcery-vim").setup()
            vim.cmd("colorscheme srcery")
        end,
    },
    {
        "daschw/leaf.nvim",
        config = function()
            require("leaf").setup({
                underlineStyle = "underline",
                commentStyle = "italic",
                functionStyle = "NONE",
                keywordStyle = "italic",
                statementStyle = "bold",
                typeStyle = "NONE",
                variablebuiltinStyle = "italic",
                transparent = false,
                colors = {},
                overrides = {},
                theme = "auto",
                contrast = "medium",
            })
        end,
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            require("rose-pine").setup({
                variant = "auto",      -- auto, main, moon, or dawn
                dark_variant = "main", -- main, moon, or dawn
                dim_inactive_windows = true,
                extend_background_behind_borders = true,

                enable = {
                    terminal = true,
                    legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
                    migrations = true,        -- Handle deprecated options automatically
                },

                styles = {
                    bold = true,
                    italic = true,
                    transparency = false,
                },

                groups = {
                    border = "muted",
                    link = "iris",
                    panel = "surface",

                    error = "love",
                    hint = "iris",
                    info = "foam",
                    note = "pine",
                    todo = "rose",
                    warn = "gold",

                    git_add = "foam",
                    git_change = "rose",
                    git_delete = "love",
                    git_dirty = "rose",
                    git_ignore = "muted",
                    git_merge = "iris",
                    git_rename = "pine",
                    git_stage = "iris",
                    git_text = "rose",
                    git_untracked = "subtle",

                    h1 = "iris",
                    h2 = "foam",
                    h3 = "rose",
                    h4 = "gold",
                    h5 = "pine",
                    h6 = "foam",
                },

                highlight_groups = {
                    TelescopeBorder = { fg = "highlight_high", bg = "none" },
                    TelescopeNormal = { bg = "none" },
                    TelescopePromptNormal = { bg = "base" },
                    TelescopeResultsNormal = { fg = "subtle", bg = "none" },
                    TelescopeSelection = { fg = "text", bg = "base" },
                    TelescopeSelectionCaret = { fg = "rose", bg = "rose" },
                    -- Comment = { fg = "foam" },
                    -- VertSplit = { fg = "muted", bg = "muted" },
                },

                before_highlight = function(group, highlight, palette)
                    -- Disable all undercurls
                    -- if highlight.undercurl then
                    --     highlight.undercurl = false
                    -- end
                    --
                    -- Change palette colour
                    -- if highlight.fg == palette.pine then
                    --     highlight.fg = palette.foam
                    -- end
                end,
            })

            -- vim.cmd("colorscheme rose-pine")
            -- vim.cmd("colorscheme rose-pine-main")
            -- vim.cmd("colorscheme rose-pine-moon")
            -- vim.cmd("colorscheme rose-pine-dawn")
        end,
    },
    {
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
                    dark0 = "#1f1f1f",
                    dark1 = "#282828",
                    dark2 = "#383838",
                    dark3 = "#3c3836",
                    dark4 = "#474341",
                    gray = "#504945",
                    -- dark0_hard = "#1d2021",
                    -- dark0 = "#282828",
                    -- dark0_soft = "#32302f",
                    -- dark1 = "#3c3836",
                    -- dark2 = "#504945",
                    -- dark3 = "#665c54",
                    -- dark4 = "#7c6f64",
                    -- light0_hard = "#f9f5d7",
                    -- light0 = "#fbf1c7",
                    -- light0_soft = "#f2e5bc",
                    -- light1 = "#ebdbb2",
                    -- light2 = "#d5c4a1",
                    -- light3 = "#bdae93",
                    -- light4 = "#a89984",
                    -- bright_red = "#fb4934",
                    -- bright_green = "#b8bb26",
                    -- bright_yellow = "#fabd2f",
                    -- bright_blue = "#83a598",
                    -- bright_purple = "#d3869b",
                    -- bright_aqua = "#8ec07c",
                    -- bright_orange = "#fe8019",
                    -- neutral_red = "#cc241d",
                    -- neutral_green = "#98971a",
                    -- neutral_yellow = "#d79921",
                    -- neutral_blue = "#458588",
                    -- neutral_purple = "#b16286",
                    -- neutral_aqua = "#689d6a",
                    -- neutral_orange = "#d65d0e",
                    -- faded_red = "#9d0006",
                    -- faded_green = "#79740e",
                    -- faded_yellow = "#b57614",
                    -- faded_blue = "#076678",
                    -- faded_purple = "#8f3f71",
                    -- faded_aqua = "#427b58",
                    -- faded_orange = "#af3a03",
                    -- dark_red_hard = "#792329",
                    -- dark_red = "#722529",
                    -- dark_red_soft = "#7b2c2f",
                    -- light_red_hard = "#fc9690",
                    -- light_red = "#fc9487",
                    -- light_red_soft = "#f78b7f",
                    -- dark_green_hard = "#5a633a",
                    -- dark_green = "#62693e",
                    -- dark_green_soft = "#686d43",
                    -- light_green_hard = "#d3d6a5",
                    -- light_green = "#d5d39b",
                    -- light_green_soft = "#cecb94",
                    -- dark_aqua_hard = "#3e4934",
                    -- dark_aqua = "#49503b",
                    -- dark_aqua_soft = "#525742",
                    -- light_aqua_hard = "#e6e9c1",
                    -- light_aqua = "#e8e5b5",
                    -- light_aqua_soft = "#e1dbac",
                    -- gray = "#928374",
                },
                overrides = {
                    Visual = { bg = "#383838" },
                },
                dim_inactive = true,
                transparent_mode = false,
            })
            -- vim.cmd("colorscheme gruvbox")
        end,
    },
}
