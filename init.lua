vim.o.breakindent = true
vim.o.completeopt = "menu,menuone,noselect"
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
vim.o.timeoutlen = 300
vim.o.whichwrap = "b,s,h,l,<,>,[,]"

vim.g.mapleader = " "
vim.g.maplocalleader = ","

vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0

vim.filetype.add({
  extension = {
    jqtpl = 'html',
  },
})

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
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup({
        on_colors = function(c)
          c.gitSigns.add = c.green
          c.gitSigns.change = c.orange
        end,
        on_highlights = function(hl, c)
          hl.CursorLineNr.fg = c.orange
        end,
      })
      vim.cmd.colorscheme("tokyonight-night")
    end,
  })

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

  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        on_attach = function(bufnr)
          local gs = package.loaded.gitsigns

          local function map(mode, l, r, opts)
            opts = opts or {}
            opts.buffer = bufnr
            vim.keymap.set(mode, l, r, opts)
          end

          map("n", "]c", function()
            if vim.wo.diff then return "]c" end
            vim.schedule(function() gs.next_hunk() end)
            return "<Ignore>"
          end, { expr = true })

          map("n", "[c", function()
            if vim.wo.diff then return "[c" end
            vim.schedule(function() gs.prev_hunk() end)
            return "<Ignore>"
          end, { expr = true })

          map({"n", "v"}, "<Leader>gS", ":Gitsigns stage_hunk<CR>")
          map("n", "<leader>gD", function() gs.diffthis("~") end)
        end,
      })
    end
  })

  use({
    "nvim-lualine/lualine.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("lualine").setup({
        options = {
          component_separators = "",
          section_separators = "",
          disabled_filetypes = {
            "Trouble",
          },
          theme = "auto",
        },
        sections = {
          lualine_a = {
            {
              "mode",
              fmt = function(str)
                return str:sub(1, 1)
              end,
            },
          },
          lualine_b = {},
          lualine_c = {"branch", "diff", "diagnostics", "searchcount", "filename"},
          lualine_x = {"filetype", "progress", "location"},
          lualine_y = {},
          lualine_z = {},
        },
      })
    end
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
    config = function()
      local default_pickers_opts = {
        theme = "ivy"
      }

      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<C-h>"] = "which_key",
            },
          },
        },
        pickers = {
          buffers = default_pickers_opts,
          find_files = default_pickers_opts,
          grep_string = default_pickers_opts,
          live_grep = default_pickers_opts,
        },
      })

      local builtin = require("telescope.builtin")

      vim.keymap.set('n', '<Leader>bb', builtin.buffers)
      vim.keymap.set('n', '<Leader>ff', builtin.find_files)
      vim.keymap.set('n', '<Leader>pf', builtin.find_files)
      vim.keymap.set('n', '<Leader>sp', builtin.grep_string)
      vim.keymap.set('n', '<Leader>fh', builtin.help_tags)
      vim.keymap.set('n', '<Leader>ss', builtin.live_grep)
      vim.keymap.set('n', '<Leader>fr', builtin.oldfiles)
    end,
  })

  use({
    "williamboman/mason-lspconfig.nvim",
    requires = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      local mason = require("mason")
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")

      mason.setup()

      mason_lspconfig.setup({
        ensure_installed = {
          "sumneko_lua",
        },
      })

      local has_cmp_nvim_lsp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      local capabilities

      if has_cmp_nvim_lsp then
        capabilities = cmp_nvim_lsp.default_capabilities()
      else
        capabilities = vim.lsp.protocol.make_client_capabilities()
      end

      mason_lspconfig.setup_handlers({
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,
        ["sumneko_lua"] = function()
          lspconfig.sumneko_lua.setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = {
                  globals = {"vim"},
                },
              },
            },
          })
        end,
      })
    end,
  })

  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      local null_ls = require("null-ls")

      local gitsigns = null_ls.builtins.code_actions.gitsigns.with({
        config = {
          filter_actions = function(title)
            return title:lower():match("blame") == nil -- filter out blame actions
          end,
        },
      })

      -- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
      null_ls.setup({
        sources = {
          gitsigns,
          null_ls.builtins.diagnostics.eslint,
          null_ls.builtins.diagnostics.todo_comments,
        },
      })
    end,
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
    config = function()
      local cmp = require("cmp")

      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end

      local feedkey = function(key, mode)
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
      end

      cmp.setup({
        mapping = cmp.mapping.preset.insert({
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif vim.fn["vsnip#available"](1) == 1 then
              feedkey("<Plug>(vsnip-expand-or-jump)", "")
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function()
            if cmp.visible() then
              cmp.select_prev_item()
            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
              feedkey("<Plug>(vsnip-jump-prev)", "")
            end
          end, { "i", "s" }),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        snippet = {
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "vsnip" },
        }, {
          { name = "buffer" },
        })
      })

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({
          { name = "path" },
        }, {
          { name = "cmdline" },
        })
      })
    end,
  })

  use({
    "moll/vim-bbye",
    config = function()
      vim.keymap.set("n", "<Leader>bd", "<cmd>Bdelete<CR>", { desc = "Delete buffer" })
      vim.keymap.set("n", "<Leader><Tab>", "<cmd>bnext<CR>", { desc = "Next buffer" })
    end,
  })

  if packer_bootstrap then
    require("packer").sync()
  end
end)

local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
  vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = '' })
end
