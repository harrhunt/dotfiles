vim.pack.add({ 'https://codeberg.org/mfussenegger/nvim-dap.git' })
vim.pack.add({ 'https://github.com/nvim-neotest/nvim-nio' })
vim.pack.add({ 'https://github.com/rcarriga/nvim-dap-ui' })
vim.pack.add({ 'https://github.com/leoluz/nvim-dap-go' })

local dap, dapui = require("dap"), require("dapui")
dapui.setup({})
require('dap-go').setup({
    dap_configurations = {
        {
            type = "go",
            name = "Debug Package (Arguments)",
            request = "launch",
            program = "${fileDirname}",
            args = require("dap-go").get_arguments,
        },
    },
})

vim.keymap.set('n', '<F5>', function() require('dap').continue() end, { desc = "DAP Continue" })
vim.keymap.set('n', '<F10>', function() require('dap').step_over() end, { desc = "DAP Step Over" })
vim.keymap.set('n', '<F11>', function() require('dap').step_into() end, { desc = "DAP Step Into" })
vim.keymap.set('n', '<F12>', function() require('dap').step_out() end, { desc = "DAP Step Out" })
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end, { desc = "Toggle Breakpoint" })
vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end, { desc = "Set Breakpoint" })
vim.keymap.set('n', '<Leader>lp',
    function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end,
    { desc = "Set Breakpoint Log Point" })
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end, { desc = "DAP Open REPL" })
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end, { desc = "DAP Run Last" })
vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
    require('dap.ui.widgets').hover()
end, { desc = "DAP Hover" })
vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
    require('dap.ui.widgets').preview()
end, { desc = "DAP Preview" })
vim.keymap.set('n', '<Leader>df', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.frames)
end, { desc = "DAP Show Frames" })
vim.keymap.set('n', '<Leader>ds', function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
end, { desc = "DAP Show Scopes" })
vim.keymap.set('n', '<Leader>du', function()
    require('dapui').toggle()
end, { desc = "DAP Hover" })

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
