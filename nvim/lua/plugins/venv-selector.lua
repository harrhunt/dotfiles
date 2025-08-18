return {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "mfussenegger/nvim-dap",
        "mfussenegger/nvim-dap-python",
        { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    lazy = false,
    branch = "regexp", -- This is the regexp branch, use this for the new version
    ---@type venv-selector.Config
    opts = {
        settings = {
            options = {
                notify_user_on_venv_activation = true,
            }
        }
    },
    ft = "python",
    keys = {
        { "<leader>vs", "<cmd>VenvSelect<cr>" },
    },
}
