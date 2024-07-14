return {
    "nvim-telescope/telescope.nvim",

    tag = "0.1.8",

    dependencies = {
        "nvim-lua/plenary.nvim"
    },

    config = function()
        require('telescope').setup({})

        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "find file by name" })
        vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "search for files only tracked by git" })

        vim.keymap.set('n', '<leader>pws', function()
            local word = vim.fn.expand("<cword>")
            builtin.grep_string({ search = word })
        end, { desc = "grep for word under cursor" })

        vim.keymap.set('n', '<leader>pWs', function()
            local word = vim.fn.expand("<cWORD>")
            builtin.grep_string({ search = word })
        end, { desc = "grep for WORD under cursor" })

        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end, { desc = "grep for string in project files" })

        vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = "open fuzzy finder for all help files" })
        vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = "open live grep for project" })
    end
}
