-- ~/.config/nvim-new/lua/keymaps.lua
local keymap = vim.keymap.set

vim.g.mapleader = " "

keymap("n", "<space>", "<Nop>")

keymap("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center the cursor" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center the cursor" })
keymap("n", "<leader>-", "<cmd>vsplit<CR>", { silent = true, desc = "Split the window vertically" })
keymap("n", "<leader>_", "<cmd>split<CR>", { silent = true, desc = "Split the window horizontally" })
keymap({ "n", "x" }, "<leader>p", [["0p]], { silent = true, desc = "Paste without overwriting the default register" })
keymap("v", "<leader>y", [["+y]], { silent = true, desc = "Yank to the system clipboard in visual mode" })
keymap("n", "<leader>Y", [["+Y]], { silent = true, desc = "Yank line to the system clipboard in normal mode" })
keymap("t", "<Esc>", "<C-\\><C-N>", { desc = "Exit terminal mode" })
keymap("i", "<C-c>", "<Esc>")

keymap("n", "<leader>cd", '<cmd>lua vim.fn.chdir(vim.fn.expand("%:p:h"))<CR>',
    { desc = "Change directory to the current file's directory" })

keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Shift visual lines down" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Shift visual lines up" })

keymap("n", "J", "mzJ`z")

keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

keymap("n", "<leader>ll", vim.pack.update, { desc = "Update packages" })
keymap("n", "<leader>ex", "<cmd>Ex %:p:h<CR>", { desc = "Open netrw in the current file's folder" })
