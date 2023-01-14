vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

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

  use("folke/tokyonight.nvim")

  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  })

  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup({
        padding = false,
      })
    end,
  })

  use("lewis6991/gitsigns.nvim")

  use({
    "nvim-lualine/lualine.nvim",
    requires = "kyazdani42/nvim-web-devicons",
  })

  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  })

  use({
    "folke/which-key.nvim",
    config = function()
      require("which-key").setup({
        plugins = {
          spelling = {
            enabled = true,
          },
        },
        window = {
          margin = { 1, 0, 1, 0 },
          padding = { 1, 0, 1, 0 },
        },
      })
    end,
  })

  use({
    "nvim-telescope/telescope.nvim",
    requires = "nvim-lua/plenary.nvim",
  })

  use({
    "williamboman/mason-lspconfig.nvim",
    requires = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
  })

  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = "nvim-lua/plenary.nvim",
  })

  use({
    "hrsh7th/nvim-cmp",
    requires = {
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-vsnip",
    },
  })

  use({
    "moll/vim-bbye",
    config = function()
      vim.keymap.set("n", "<Leader>bd", "<cmd>Bdelete<CR>", { desc = "Delete buffer" })
      vim.keymap.set("n", "<Leader><Tab>", "<cmd>bnext<CR>", { desc = "Next buffer" })
    end,
  })

  use("lewis6991/impatient.nvim")

  if packer_bootstrap then
    require("packer").sync()
  end
end)
