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
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    config = function()
      require('lualine').setup {
        options = {
          component_separators = '',
          section_separators = '',
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {
            'encoding',
            { 'fileformat', symbols = { unix = 'unix', dos = 'dos', mac = 'mac' } },
            'filetype'
          },
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        }
      }
    end
  }

  use {
    'folke/which-key.nvim',
    commit = '61553aeb3d5ca8c11eea8be6eadf478062982ac9',
    config = function()
      require('which-key').setup {
      }
    end
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
    config = function()
      require('lspconfig').rust_analyzer.setup {
      }
      require('lspconfig').sumneko_lua.setup {
        settings = {
          Lua = {
            diagnostics = {
              globals = { 'vim' }
            }
          }
        }
      }
    end
  }

  use {
    'nvim-telescope/telescope.nvim',
    commit = 'cabf991b1d3996fa6f3232327fc649bbdf676496',
    requires = { {'nvim-lua/plenary.nvim'} }
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

  use({
    'jose-elias-alvarez/null-ls.nvim',
    commit = 'f1182c2d3748da7c94f5288f8054741f26f0cf3b',
    requires = { "nvim-lua/plenary.nvim" },
  })

end)
