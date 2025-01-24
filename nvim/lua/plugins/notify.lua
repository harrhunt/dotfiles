return {
    "rcarriga/nvim-notify",
    config = function()
        local notify = require("notify")
        notify.setup({
            background_colour = "#322323",
        })
        vim.notify = notify
        require("telescope").load_extension("notify")
        vim.keymap.set("n", "<leader>pnh", ":Telescope notify<CR>", { desc = "Open notification history in telescope" })
        vim.keymap.set("n", "<leader>pnc", ":NotificationsClear<CR>", { desc = "Clear notifications" })
    end,
}
