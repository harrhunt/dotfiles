return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
            "nvimtools/none-ls.nvim",
            "nvimtools/none-ls-extras.nvim",
            "williamboman/mason-null-ls.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/nvim-cmp",
            "L3MON4D3/LuaSnip",
            "onsails/lspkind.nvim",
            "nvimdev/lspsaga.nvim",
            "saadparwaiz1/cmp_luasnip",
            "j-hui/fidget.nvim",
        },
        config = function()
            local lspkind = require("lspkind")
            local null_ls = require("null-ls")
            local cmp = require("cmp")

            local cmp_lsp = require("cmp_nvim_lsp")
            local capabilities = vim.tbl_deep_extend(
                "force",
                {},
                vim.lsp.protocol.make_client_capabilities(),
                cmp_lsp.default_capabilities())

            require("fidget").setup({})
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "ruff",
                    "pylsp",
                    "taplo",
                    "biome",
                    "ts_ls",
                    "zls",
                },
            })
            require("mason-null-ls").setup({
                ensure_installed = {
                    "jq",
                    "djlint",
                },
                automatic_installation = false,
                handlers = {},
            })
            null_ls.setup({
                sources = {
                    require("none-ls.formatting.jq"),
                }
            })

            local cmp_select = { behavior = cmp.SelectBehavior.Select }

            cmp.setup({
                formatting = {
                    format = lspkind.cmp_format({
                        mode = 'symbol',
                        maxwidth = {
                            menu = 50,
                            abbr = 50,
                        },
                        ellipsis_char = '...',
                        show_labelDetails = true,

                        before = function(entry, vim_item)
                            return vim_item
                        end
                    })
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                    ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                    ["<C-f>"] = cmp.mapping.confirm({ select = true }),
                    ["<C-Space>"] = cmp.mapping.complete(),

                }),
                sources = cmp.config.sources({
                    { name = "nvim_lsp" },
                    { name = "luasnip" }, -- For luasnip users.
                    { name = "neorg" },
                }, {
                    { name = "buffer" },
                })
            })

            require("lspsaga").setup({
                lightbulb = {
                    enable = false,
                },
            })

            vim.diagnostic.config({
                signs = false,
                -- update_in_insert = true,
                float = {
                    focusable = false,
                    style = "minimal",

                    border = "rounded",

                    source = true,
                    header = "",

                    prefix = "",
                },
            })
        end,
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "InsertEnter",
        opts = {
            bind = true,
            floating_window = true,
            handler_opts = {
                border = "rounded"
            },
            select_signature_key = "<M-n>",
        },
        config = function(_, opts)
            require('lsp_signature').setup(opts)
        end
    },
}
