-- Improve the ':Explore' UI to be easier to use
vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

opt.number = true -- show line numbers

-- tabs and indentation
opt.tabstop = 4 -- two spaces for tabs
opt.shiftwidth = 4 -- two spaces for indent width
opt.expandtab = true -- expand tab into spaces
opt.autoindent = true -- copy indent from current line into new line

opt.wrap = false

-- search settings
opt.ignorecase = true -- ignore case when searching
opt.smartcase = true -- mixed case input will assume case sensitive

opt.cursorline = true -- highliight current line

-- colors
opt.termguicolors = true
opt.background = "dark" -- prefer dark
opt.signcolumn = "yes" -- show sign column so text will not shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace to work as expected

-- clipboard
opt.clipboard:append("unnamedplus") -- system clipboard as default register

-- window splitting
opt.splitright = true -- splitting windows vertically will go to the right
opt.splitbelow = true -- splitting windows horizontally will go to the bottom

-- turn off swapfile
opt.swapfile = false
