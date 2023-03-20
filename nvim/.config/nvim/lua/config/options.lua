-- Vim configuration
vim.g.mapleader = "," -- leader key
vim.o.clipboard = "unnamedplus"
vim.o.autoread = true
vim.o.mouse = "a" -- mouse support
vim.o.number = true -- line numbers
vim.o.swapfile = false -- no swap file
vim.o.termguicolors = true -- full color in terminal
vim.o.timeoutlen = 200
vim.o.undofile = false -- no undo file
vim.o.wrap = false -- no word wrap

vim.o.ignorecase = true
vim.o.smartcase = true

vim.o.cc = 80
vim.o.cursorline = true -- add cursor line

vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.expandtab = true

vim.opt.list = true
vim.opt.listchars:append("eol:↵")

vim.cmd([[color tokyonight]])
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.opt.foldlevelstart = 1

vim.cmd("autocmd BufNewFile,BufRead *.jbuilder set ft=ruby")
