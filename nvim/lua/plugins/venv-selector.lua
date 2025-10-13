return {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
        "neovim/nvim-lspconfig",
        "mfussenegger/nvim-dap",
        "mfussenegger/nvim-dap-python",
        { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
    },
    ft = "python",
    opts = {
        options = {
            notify_user_on_venv_activation = true,
        }
    },
    keys = {
        { "<leader>vs", "<cmd>VenvSelect<cr>" },
    },
}
