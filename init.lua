local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

vim.o.breakindent = true
-- vim.o.clipboard = "unnamedplus"
vim.o.completeopt = "menu,menuone,noselect"
vim.o.copyindent = true
vim.o.cursorline = true
vim.o.cursorlineopt = "number"
vim.o.expandtab = true
vim.o.foldenable = false
vim.o.foldexpr = "nvim_treesitter#foldexpr()"
vim.o.foldmethod = "expr"
vim.o.foldtext = ""
vim.o.ignorecase = true
vim.o.list = true
vim.o.matchpairs = "(:),{:},[:],<:>,=:;"
vim.o.matchtime = 5
vim.o.number = true
vim.o.scrolloff = 4
vim.o.sessionoptions =
  "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.o.shiftround = true
vim.o.shiftwidth = 2
vim.o.showmatch = true
vim.o.signcolumn = "yes"
vim.o.smartcase = true
vim.o.spell = true
vim.o.spelllang = "en_gb"
vim.o.spelloptions = "camel"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.termguicolors = true
vim.o.timeoutlen = 300
vim.o.updatetime = 300
vim.o.virtualedit = "block"
vim.o.whichwrap = "b,s,<,>,[,]"

vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0

require("lazy").setup("plugins")
require("keymaps")
require("autocmds")
