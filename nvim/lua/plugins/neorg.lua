return {
    {
        "nvim-neorg/neorg",
        lazy = false,
        version = "*",
        config = function()
            require("neorg").setup({
                load = {
                    ["core.defaults"] = {},
                    ["core.concealer"] = {
                        config = {
                            icon_preset = "diamond",
                            icons = {
                                todo = {
                                    undone = {
                                        icon = " ",
                                    },
                                },
                            },
                        },
                    },
                    ["core.dirman"] = {
                        config = {
                            workspaces = {
                                notes = "~/notes",
                            },
                            default_workspace = "notes",
                        },
                    },
                    ["core.completion"] = {
                        config = {
                            engine = "nvim-cmp",
                        },
                    },
                },
            })
            vim.keymap.set("i", "<C-D>", "<Plug>(neorg.promo.promote)", { buffer = true })
        end,
    },
}
