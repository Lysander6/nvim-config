-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

return require('packer').startup(function(use)
  use {
    'wbthomason/packer.nvim',
    commit = 'dac4088c70f4337c6c40d1a2751266a324765797'
  }

  use {
    'folke/tokyonight.nvim',
    commit = '14ab22b51d0f54de3402bd706e9e91836de39a92'
  }

  use {
    'nvim-lualine/lualine.nvim',
    commit = 'bfa0d99ba6f98d077dd91779841f1c88b7b5c165',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use {
    'folke/which-key.nvim',
    commit = '61553aeb3d5ca8c11eea8be6eadf478062982ac9'
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    commit = 'ee095abeac5842943a94a27c0ca75c61e7c614a2',
    run = function()
      local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
      ts_update()
    end,
    config = function()
      require('nvim-treesitter.configs').setup {
        ensure_installed = { 'lua', 'markdown', 'markdown_inline' }
      }
    end
  }

  use {
    'williamboman/mason.nvim',
    commit = 'a1af30116e1bfbd3aa8048b396c324373415958f',
    config = function()
      require('mason').setup()
    end
  }

  use {
    'williamboman/mason-lspconfig.nvim',
    commit = 'e8bd50153b94cc5bbfe3f59fc10ec7c4902dd526',
    requires = { 'williamboman/mason.nvim' },
    config = function()
      require('mason-lspconfig').setup {
        ensure_installed = { 'rust_analyzer', 'sumneko_lua' }
      }
    end
  }

  use {
    'neovim/nvim-lspconfig',
    commit = '973aa14d0992df82ff82f714d978a3eb8d676600',
    requires = { 'williamboman/mason.nvim', 'williamboman/mason-lspconfig.nvim' },
  }

  use {
    'nvim-telescope/telescope.nvim',
    commit = 'cabf991b1d3996fa6f3232327fc649bbdf676496',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use {
    'ahmedkhalf/project.nvim',
    commit = '685bc8e3890d2feb07ccf919522c97f7d33b94e4',
    requires = { 'nvim-telescope/telescope.nvim' },
    config = function()
      require('project_nvim').setup {
        require('telescope').load_extension('projects')
      }
    end
  }

  use {
    'lewis6991/impatient.nvim',
    commit = '9f7eed8133d62457f7ad2ca250eb9b837a4adeb7'
  }

  use {
    'lewis6991/gitsigns.nvim',
    commit = '71644a2907adc076f1c5e712f59d897f5197d5d6'
  }

  use {
    'jose-elias-alvarez/null-ls.nvim',
    commit = 'f1182c2d3748da7c94f5288f8054741f26f0cf3b',
    requires = { 'nvim-lua/plenary.nvim' },
  }

  use {
    'hrsh7th/nvim-cmp',
    commit = '8bbaeda725d5db6e4e1be2867a64b43bf547cf06'
  }

  use {
    'hrsh7th/vim-vsnip',
    commit = 'e44026b5394fd79aa0f2118aaf41627ef9c354ee'
  }

  use {
    'hrsh7th/cmp-vsnip',
    commit = '989a8a73c44e926199bfd05fa7a516d51f2d2752',
    requires = { 'hrsh7th/nvim-cmp', 'hrsh7th/vim-vsnip' }
  }

  use {
    'hrsh7th/cmp-nvim-lsp',
    commit = '59224771f91b86d1de12570b4070fe4ad7cd1eeb',
    requires = { 'neovim/nvim-lspconfig', 'hrsh7th/nvim-cmp' }
  }

  use {
    'hrsh7th/cmp-buffer',
    commit = '3022dbc9166796b644a841a02de8dd1cc1d311fa',
    requires = { 'hrsh7th/nvim-cmp' }
  }

  use {
    'hrsh7th/cmp-path',
    commit = '91ff86cd9c29299a64f968ebb45846c485725f23',
    requires = { 'hrsh7th/nvim-cmp' }
  }

  use {
    'hrsh7th/cmp-cmdline',
    commit = '23c51b2a3c00f6abc4e922dbd7c3b9aca6992063',
    requires = { 'hrsh7th/nvim-cmp' }
  }

  use {
    'hrsh7th/cmp-nvim-lsp-signature-help',
    commit = 'd2768cb1b83de649d57d967085fe73c5e01f8fd7',
    requires = { 'hrsh7th/nvim-cmp' }
  }

  use {
    'windwp/nvim-autopairs',
    commit = 'b5994e6547d64f781cfca853a1aa6174d238fe0e'
  }

  use {
    'nvim-tree/nvim-tree.lua',
    commit = 'e14c2895b4f36a22001f7773244041c173dcf867'
  }

  use {
    'moll/vim-bbye',
    commit = '25ef93ac5a87526111f43e5110675032dbcacf56'
  }

  use {
    'TimUntersberger/neogit',
    commit = '0d6002c6af432343937283fb70791fc76fa7227c',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  use {
    'folke/trouble.nvim',
    commit = '897542f90050c3230856bc6e45de58b94c700bbf',
    requires = { 'kyazdani42/nvim-web-devicons' }
  }

end)
