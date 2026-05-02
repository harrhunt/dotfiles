vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(ev)
        local name, kind = ev.data.spec.name, ev.data.kind
        if name == 'nvim-treesitter' and kind == 'update' then
            if not ev.data.active then vim.cmd.packadd('nvim-treesitter') end
            vim.cmd('TSUpdate')
        end
    end
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { '<filetype>' },
    callback = function(args)
        local filetype = args.match
        local lang = vim.treesitter.language.get_lang(filetype)
        if lang and vim.treesitter.language.add(lang) then
            vim.wo[0][0].foldexpr = 'v:lua.vim.treesitter.foldexpr()'
            vim.wo[0][0].foldmethod = 'expr'
            vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            vim.treesitter.start()
        end
    end
})

vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter' })
vim.pack.add({ 'https://github.com/nvim-treesitter/nvim-treesitter-textobjects' })

require('nvim-treesitter').install({ 'python', 'javascript', 'go', 'zig', 'typst', 'lua', 'svelte', 'typescript', 'scss' })
require('nvim-treesitter').setup()
require("nvim-treesitter-textobjects").setup({
    select = {
        lookahead = true,
    },
    move = {
        set_jumps = true,
    },
})

-- select
vim.keymap.set({ "x", "o" }, "a=", function() require("nvim-treesitter-textobjects.select").select_textobject("@assignment.outer", "textobjects") end, { desc = "Select outer part of an assignment" })
vim.keymap.set({ "x", "o" }, "i=", function() require("nvim-treesitter-textobjects.select").select_textobject("@assignment.inner", "textobjects") end, { desc = "Select inner part of an assignment" })
vim.keymap.set({ "x", "o" }, "aa", function() require("nvim-treesitter-textobjects.select").select_textobject("@parameter.outer", "textobjects") end, { desc = "Select outer part of a parameter/argument" })
vim.keymap.set({ "x", "o" }, "ia", function() require("nvim-treesitter-textobjects.select").select_textobject("@parameter.inner", "textobjects") end, { desc = "Select inner part of a parameter/argument" })
vim.keymap.set({ "x", "o" }, "ai", function() require("nvim-treesitter-textobjects.select").select_textobject("@conditional.outer", "textobjects") end, { desc = "Select outer part of a conditional" })
vim.keymap.set({ "x", "o" }, "ii", function() require("nvim-treesitter-textobjects.select").select_textobject("@conditional.inner", "textobjects") end, { desc = "Select inner part of a conditional" })
vim.keymap.set({ "x", "o" }, "al", function() require("nvim-treesitter-textobjects.select").select_textobject("@loop.outer", "textobjects") end, { desc = "Select outer part of a loop" })
vim.keymap.set({ "x", "o" }, "il", function() require("nvim-treesitter-textobjects.select").select_textobject("@loop.inner", "textobjects") end, { desc = "Select inner part of a loop" })
vim.keymap.set({ "x", "o" }, "af", function() require("nvim-treesitter-textobjects.select").select_textobject("@call.outer", "textobjects") end, { desc = "Select outer part of a function call" })
vim.keymap.set({ "x", "o" }, "if", function() require("nvim-treesitter-textobjects.select").select_textobject("@call.inner", "textobjects") end, { desc = "Select inner part of a function call" })
vim.keymap.set({ "x", "o" }, "am", function() require("nvim-treesitter-textobjects.select").select_textobject("@function.outer", "textobjects") end, { desc = "Select outer part of a method/function definition" })
vim.keymap.set({ "x", "o" }, "im", function() require("nvim-treesitter-textobjects.select").select_textobject("@function.inner", "textobjects") end, { desc = "Select inner part of a method/function definition" })
vim.keymap.set({ "x", "o" }, "ac", function() require("nvim-treesitter-textobjects.select").select_textobject("@class.outer", "textobjects") end, { desc = "Select outer part of a class" })
vim.keymap.set({ "x", "o" }, "ic", function() require("nvim-treesitter-textobjects.select").select_textobject("@class.inner", "textobjects") end, { desc = "Select inner part of a class" })
vim.keymap.set({ "x", "o" }, "is", function() require("nvim-treesitter-textobjects.select").select_textobject("@local.scope", "locals") end, { desc = "Select local scope" })

-- swap
vim.keymap.set("n", "<leader>a", function() require("nvim-treesitter-textobjects.swap").swap_next "@parameter.inner" end)
vim.keymap.set("n", "<leader>A", function() require("nvim-treesitter-textobjects.swap").swap_previous "@parameter.outer" end)

-- move
-- next-start
vim.keymap.set({ "n", "x", "o" }, "]]", function() require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects") end, { desc = "Next class start" })
vim.keymap.set({ "n", "x", "o" }, "]c", function() require("nvim-treesitter-textobjects.move").goto_next_start("@class.outer", "textobjects") end, { desc = "Next class start" })
vim.keymap.set({ "n", "x", "o" }, "]f", function() require("nvim-treesitter-textobjects.move").goto_next_start("@call.outer", "textobjects") end, { desc = "Next function call start" })
vim.keymap.set({ "n", "x", "o" }, "]m", function() require("nvim-treesitter-textobjects.move").goto_next_start("@function.outer", "textobjects") end, { desc = "Next method/function def start" })
vim.keymap.set({ "n", "x", "o" }, "]i", function() require("nvim-treesitter-textobjects.move").goto_next_start("@conditional.outer", "textobjects") end, { desc = "Next conditional start" })
vim.keymap.set({ "n", "x", "o" }, "]l", function() require("nvim-treesitter-textobjects.move").goto_next_start("@loop.outer", "textobjects") end, { desc = "Next loop start" })
vim.keymap.set({ "n", "x", "o" }, "]p", function() require("nvim-treesitter-textobjects.move").goto_next_start("@parameter.inner", "textobjects") end, { desc = "Next parameter start" })

-- vim.keymap.set({ "n", "x", "o" }, "]s", function() require("nvim-treesitter-textobjects.move").goto_next_start("@local.scope", "locals") end, { desc = "Next scope" })
vim.keymap.set({ "n", "x", "o" }, "]z", function() require("nvim-treesitter-textobjects.move").goto_next_start("@fold", "folds") end, { desc = "folds" })

-- next-end
vim.keymap.set({ "n", "x", "o" }, "]]", function() require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects") end, { desc = "Next class end" })
vim.keymap.set({ "n", "x", "o" }, "]C", function() require("nvim-treesitter-textobjects.move").goto_next_end("@class.outer", "textobjects") end, { desc = "Next class end" })
vim.keymap.set({ "n", "x", "o" }, "]F", function() require("nvim-treesitter-textobjects.move").goto_next_end("@call.outer", "textobjects") end, { desc = "Next function call end" })
vim.keymap.set({ "n", "x", "o" }, "]M", function() require("nvim-treesitter-textobjects.move").goto_next_end("@function.outer", "textobjects") end, { desc = "Next method/function def end" })
vim.keymap.set({ "n", "x", "o" }, "]I", function() require("nvim-treesitter-textobjects.move").goto_next_end("@conditional.outer", "textobjects") end, { desc = "Next conditional end" })
vim.keymap.set({ "n", "x", "o" }, "]L", function() require("nvim-treesitter-textobjects.move").goto_next_end("@loop.outer", "textobjects") end, { desc = "Next loop end" })
vim.keymap.set({ "n", "x", "o" }, "]P", function() require("nvim-treesitter-textobjects.move").goto_next_end("@parameter.inner", "textobjects") end, { desc = "Next parameter end" })

-- previous-start
vim.keymap.set({ "n", "x", "o" }, "[]", function() require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects") end, { desc = "Prev class start" })
vim.keymap.set({ "n", "x", "o" }, "[c", function() require("nvim-treesitter-textobjects.move").goto_previous_start("@class.outer", "textobjects") end, { desc = "Prev class start" })
vim.keymap.set({ "n", "x", "o" }, "[f", function() require("nvim-treesitter-textobjects.move").goto_previous_start("@call.outer", "textobjects") end, { desc = "Prev function call start" })
vim.keymap.set({ "n", "x", "o" }, "[m", function() require("nvim-treesitter-textobjects.move").goto_previous_start("@function.outer", "textobjects") end, { desc = "Prev method/function def start" })
vim.keymap.set({ "n", "x", "o" }, "[i", function() require("nvim-treesitter-textobjects.move").goto_previous_start("@conditional.outer", "textobjects") end, { desc = "Prev conditional start" })
vim.keymap.set({ "n", "x", "o" }, "[l", function() require("nvim-treesitter-textobjects.move").goto_previous_start("@loop.outer", "textobjects") end, { desc = "Prev loop start" })
vim.keymap.set({ "n", "x", "o" }, "[p", function() require("nvim-treesitter-textobjects.move").goto_previous_start("@parameter.inner", "textobjects") end, { desc = "Prev parameter start" })

-- previous-end
vim.keymap.set({ "n", "x", "o" }, "[]", function() require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects") end, { desc = "Prev class end" })
vim.keymap.set({ "n", "x", "o" }, "[C", function() require("nvim-treesitter-textobjects.move").goto_previous_end("@class.outer", "textobjects") end, { desc = "Prev class end" })
vim.keymap.set({ "n", "x", "o" }, "[F", function() require("nvim-treesitter-textobjects.move").goto_previous_end("@call.outer", "textobjects") end, { desc = "Prev function call end" })
vim.keymap.set({ "n", "x", "o" }, "[M", function() require("nvim-treesitter-textobjects.move").goto_previous_end("@function.outer", "textobjects") end, { desc = "Prev method/function def end" })
vim.keymap.set({ "n", "x", "o" }, "[I", function() require("nvim-treesitter-textobjects.move").goto_previous_end("@conditional.outer", "textobjects") end, { desc = "Prev conditional end" })
vim.keymap.set({ "n", "x", "o" }, "[L", function() require("nvim-treesitter-textobjects.move").goto_previous_end("@loop.outer", "textobjects") end, { desc = "Prev loop end" })
vim.keymap.set({ "n", "x", "o" }, "[P", function() require("nvim-treesitter-textobjects.move").goto_previous_end("@parameter.inner", "textobjects") end, { desc = "Prev parameter end" })

local ts_repeat_move = require("nvim-treesitter-textobjects.repeatable_move")

-- Repeat movement with ; and ,
-- ensure ; goes forward and , goes backward regardless of the last direction
vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move_next)
vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_previous)

-- vim way: ; goes to the direction you were moving.
-- vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
-- vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)

-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
