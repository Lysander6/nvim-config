vim.o.breakindent = true
vim.o.copyindent = true
vim.o.cursorline = true
vim.o.cursorlineopt = "number"
vim.o.expandtab = true
vim.o.ignorecase = true
vim.o.list = true
vim.o.matchpairs = "(:),{:},[:],<:>,=:;"
vim.o.matchtime = 5
vim.o.number = true
vim.o.scrolloff = 4
vim.o.shiftwidth = 2
vim.o.showmatch = true
vim.o.smartcase = true
vim.o.spell = true
vim.o.spelllang = "en_gb"
vim.o.spelloptions = "camel"
vim.o.termguicolors = true
vim.o.whichwrap = "b,s,h,l,<,>,[,]"

vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0

-- initialize packer.nvim
local ensure_packer = function()
  local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({
      "git",
      "clone",
      "--depth=1",
      "--filter=blob:none",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    })
    vim.cmd.packadd("packer.nvim")
    return true
  end

  return false
end

local packer_bootstrap = ensure_packer()
-- end packer.nvim initialization

require("packer").startup(function(use)
  use("wbthomason/packer.nvim")

  use({
    "rebelot/kanagawa.nvim",
    config = function()
      vim.cmd.colorscheme("kanagawa")
    end,
  })

  if packer_bootstrap then
    require("packer").sync()
  end
end)
