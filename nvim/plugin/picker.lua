vim.pack.add({
    'https://github.com/nvim-tree/nvim-web-devicons',
    'https://github.com/ibhagwan/fzf-lua',
})

require("fzf-lua").setup({
    ui_select = {},
    -- -- MISC GLOBAL SETUP OPTIONS, SEE BELOW
    -- -- each of these options can also be passed as function that return options table
    -- -- e.g. winopts = function() return { ... } end
    -- winopts = { ... },   -- UI Options
    -- keymap = { ... },    -- Neovim keymaps / fzf binds
    -- actions = { ... },   -- Fzf "accept" binds
    -- fzf_opts = { ... },  -- Fzf CLI flags
    -- fzf_colors = { ... }, -- Fzf `--color` specification
    -- hls = { ... },       -- Highlights
    -- previewers = { ... }, -- Previewers options
    -- -- SPECIFIC COMMAND/PICKER OPTIONS, SEE BELOW
    -- -- files = { ... },
})

vim.keymap.set("n", "<leader>fb", function()
    require("fzf-lua").buffers()
end)
vim.keymap.set("n", "<leader>ff", function()
    require("fzf-lua").files()
end)
vim.keymap.set("n", "<leader><leader>", function()
    require("fzf-lua").vcs_files()
end)
vim.keymap.set("n", "<leader>fg", function()
    require("fzf-lua").grep()
end)
vim.keymap.set("n", "<leader>fl", function()
    require("fzf-lua").live_grep()
end)
vim.keymap.set("n", "<leader>fr", function()
    require("fzf-lua").git_files({
        cmd = "git ls-files --modified --others"
    })
end)
vim.keymap.set("n", "<leader>fs", function()
    require("fzf-lua").git_status()
end)
vim.keymap.set("n", "<leader>fdd", function()
    require("fzf-lua").diagnostics_document()
end)
vim.keymap.set("n", "<leader>fdw", function()
    require("fzf-lua").diagnostics_workspace()
end)
