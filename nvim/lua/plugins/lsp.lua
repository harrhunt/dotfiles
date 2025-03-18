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
                },
                handlers = {
                    function(server_name) -- default handler (optional)
                        require("lspconfig")[server_name].setup {
                            capabilities = capabilities

                        }
                    end,

                    biome = function()
                        local lspconfig = require("lspconfig")
                        lspconfig.biome.setup {
                            capabilities = capabilities,
                            single_file_support = true,
                        }
                    end,

                    ["ts_ls"] = function()
                        local lspconfig = require("lspconfig")
                        lspconfig.ts_ls.setup {
                            capabilities = capabilities,
                            settings = {
                                javascript = {
                                    format = {
                                        enable = false,
                                    },
                                },
                                typescript = {
                                    format = {
                                        enable = false,
                                    },
                                },
                            },
                        }
                    end,

                    ["lua_ls"] = function()
                        local lspconfig = require("lspconfig")
                        lspconfig.lua_ls.setup {
                            capabilities = capabilities,
                            settings = {
                                Lua = {
                                    runtime = { version = "Lua 5.1" },
                                    diagnostics = {

                                        globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                                    },
                                    workspace = {
                                        library = {
                                            vim.env.VIMRUNTIME,
                                        }
                                    }
                                }
                            }
                        }
                    end,
                    pylsp = function()
                        local lspconfig = require("lspconfig")
                        local function mypy_venv()
                            local virtual = os.getenv("VIRTUAL_ENV") or "/usr"
                            return { "--python-executable", virtual .. "/bin/python", true }
                        end
                        lspconfig.pylsp.setup {
                            settings = {
                                pylsp = {
                                    plugins = {
                                        -- formatter options
                                        black = { enabled = false },
                                        autopep8 = { enabled = false },
                                        yapf = { enabled = false },
                                        -- linter options
                                        pylint = { enabled = false, executable = "pylint" },

                                        ruff = { enabled = false },
                                        pyflakes = { enabled = false },

                                        pycodestyle = { enabled = false },
                                        -- type checker
                                        pylsp_mypy = {
                                            enabled = true,
                                            overrides = mypy_venv(),
                                            report_progress = true,
                                            live_mode = false,
                                        },
                                        -- auto-completion options

                                        jedi_completion = { fuzzy = true },
                                        -- import sorting
                                        isort = { enabled = true },
                                    },
                                },
                            },
                            flags = {

                                debounce_text_changes = 200,
                            },
                            capabilities = capabilities,
                        }
                    end
                }
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

            local lspconfig = require("lspconfig")
            lspconfig.zls.setup({
                capabilities = capabilities,
                root_dir = lspconfig.util.root_pattern(".git", "build.zig", "zls.json"),
                settings = {
                    zls = {
                        enable_inlay_hints = true,
                        enable_snippets = true,
                        warn_style = true,
                    },
                },
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
