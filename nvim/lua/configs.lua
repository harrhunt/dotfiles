local opt = vim.opt

opt.autoindent = true -- Enable auto indentation
opt.expandtab = true -- Use spaces instead of tabs
opt.tabstop = 4 -- Number of spaces for a tab
opt.softtabstop = 4 -- Number of spaces for a tab when editing
opt.shiftwidth = 4 -- Number of spaces for autoindent
opt.shiftround = true -- Round indent to multiple of shiftwidth
opt.listchars = "tab: ,multispace:|   " -- Characters to show for tabs, spaces, and end of line

opt.wrap = false -- Disable line wrapping

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.scrolloff = 8      -- Keep 8 lines above and below the cursor
opt.signcolumn = "yes" -- Always show sign column
opt.isfname:append("@-@")

opt.colorcolumn = "80"                               -- Highlight column 80
opt.termguicolors = true                             -- Enable true colors
opt.list = true                                      -- Show whitespace characters
opt.number = true                                    -- Show line numbers
opt.relativenumber = true                            -- Show relative line numbers
opt.numberwidth = 2                                  -- Width of the line number column
opt.cursorline = true                                -- Highlight the current line
opt.inccommand = "nosplit"                           -- Shows the effects of a command incrementally in the buffer
opt.completeopt = { "menuone", "popup", "noinsert" } -- Options for completion menu
opt.winborder = "rounded"                            -- Use rounded borders for windows
opt.hlsearch = false                                 -- Disable highlighting of search results
opt.incsearch = true

opt.colorcolumn = "80"

opt.splitright = true
opt.splitbelow = true

opt.spell = true

opt.updatetime = 50

vim.cmd.filetype("plugin indent on") -- Enable filetype detection, plugins, and indentation
