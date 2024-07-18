return {
    {
        "mfussenegger/nvim-dap",
        config = function()
            local dap = require("dap")
            dap.configurations.python = {
                {
                    type = "debugpy",
                    request = "launch",
                    name = "Flask",
                    module = "flask",
                    args = {
                        "run",
                        "--debug",
                        "--host",
                        "0.0.0.0",
                    },
                    console = "integratedTerminal",
                },
            }
            vim.keymap.set("n", "<F10>", "<cmd>lua require'dap'.step_over()<CR>")
            vim.keymap.set("n", "<F11>", "<cmd>lua require'dap'.step_into()<CR>")
            vim.keymap.set("n", "<F12>", "<cmd>lua require'dap'.step_out()<CR>")
            vim.keymap.set("n", "<F5>", "<cmd>lua require'dap'.continue()<CR>")
            vim.keymap.set("n", "<leader>vb", "<cmd>lua require'dap'.toggle_breakpoint()<CR>")
            vim.keymap.set("n", "<leader>vu", "<cmd>lua require'dapui'.toggle()<CR>")
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        dependencies = {
            "mfussenegger/nvim-dap",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup()

            dap.listeners.before.attach.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.launch.dapui_config = function()
                dapui.open()
            end
            dap.listeners.before.event_terminated.dapui_config = function()
                dapui.close()
            end
            dap.listeners.before.event_exited.dapui_config = function()
                dapui.close()
            end
        end,
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
            "williamboman/mason.nvim",
            "mfussenegger/nvim-dap",
        },
        config = function()
            require("mason-nvim-dap").setup({
                ensure_installed = { "python" },
            })
        end,
    },
    {
        "mfussenegger/nvim-dap-python",
        dependencies = {
            "mfussenegger/nvim-dap",
            "rcarriga/nvim-dap-ui",
        },
        ft = { "python" },
        config = function()
            require("dap-python").setup()
        end,
    },
}
