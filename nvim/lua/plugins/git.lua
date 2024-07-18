return {
    {
        "tpope/vim-fugitive",
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({
                on_attach = function(bufnr)
                    local gitsigns = require("gitsigns")

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    map("n", "]c", function()
                        if vim.wo.diff then
                            vim.cmd.normal({ "]c", bang = true })
                        else
                            gitsigns.nav_hunk("next")
                        end
                    end)

                    map("n", "[c", function()
                        if vim.wo.diff then
                            vim.cmd.normal({ "[c", bang = true })
                        else
                            gitsigns.nav_hunk("prev")
                        end
                    end)

                    map("n", "<leader>hs", gitsigns.stage_hunk, { desc = "stage hunk" })
                    map("n", "<leader>hr", gitsigns.reset_hunk, { desc = "reset hunk" })
                    map("v", "<leader>hs", function() gitsigns.stage_hunk { vim.fn.line("."), vim.fn.line("v") } end,
                        { desc = "stage hunk visual" })
                    map("v", "<leader>hr", function() gitsigns.reset_hunk { vim.fn.line("."), vim.fn.line("v") } end,
                        { desc = "reset hunk visual" })
                    map("n", "<leader>hS", gitsigns.stage_buffer, { desc = "stage buffer" })
                    map("n", "<leader>hR", gitsigns.reset_buffer, { desc = "reset buffer" })
                    map("n", "<leader>hp", gitsigns.preview_hunk, { desc = "preview hunk" })
                    map("n", "<leader>hu", gitsigns.undo_stage_hunk, { desc = "undo stage hunk" })
                    map("n", "<leader>hb", function() gitsigns.blame_line { full = true } end,
                        { desc = "blame line full" })
                    map("n", "<leader>tb", gitsigns.toggle_current_line_blame, { desc = "toggle current line's blame" })
                    map("n", "<leader>hd", gitsigns.diffthis, { desc = "show diff" })
                    map("n", "<leader>hD", function() gitsigns.diffthis("~") end, { desc = "show file diff" })
                    map("n", "<leader>td", gitsigns.toggle_deleted, { desc = "toggle deleted" })

                    map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "x mode select hunk" })
                end
            })
        end
    },
}
