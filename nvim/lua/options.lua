local opt = vim.opt

opt.number = true
opt.cursorline = true
vim.wo.relativenumber = true
opt.autoindent = true

local opts = {noremap = true, silent = true}

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true

vim.opt.listchars = {eol = '↵', tab = '» ', lead = '•', trail = '•'}
vim.opt.list = true
