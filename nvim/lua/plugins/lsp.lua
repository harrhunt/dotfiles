return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },
    config = function()
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
                "rust_analyzer",
                "jinja_lsp",
                "ruff_lsp",
                "pylsp",
                "taplo",
            },
            handlers = {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities

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
                                        report_progress = true,
                                        live_mode = true,
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


        vim.diagnostic.config({
            -- update_in_insert = true,
            float = {
                focusable = false,
                style = "minimal",

                border = "rounded",

                source = "always",
                header = "",

                prefix = "",
            },
        })
    end,
}
