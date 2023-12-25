return {
  {
    "nvim-lualine/lualine.nvim",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = function()
      local lualine_require = require("lualine_require")
      lualine_require.require = require

      local window_number = {
        function()
          return vim.fn.winnr()
        end,
      }

      return {
        options = {
          component_separators = "",
          section_separators = "",
          disabled_filetypes = {
            "neo-tree",
            "Trouble",
          },
          theme = "catppuccin",
        },
        sections = {
          lualine_a = {
            window_number,
          },
          lualine_b = {},
          lualine_c = {
            "branch",
            {
              "diff",
              symbols = {
                added = "+", -- " ",
                modified = "~", -- " ",
                removed = "-", -- " ",
              },
              source = function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                  return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                  }
                end
              end,
            },
            {
              "diagnostics",
              -- symbols = {
              --   error = " ",
              --   warn = " ",
              --   info = " ",
              --   hint = " ",
              -- },
            },
            "searchcount",
            "filename",
          },
          lualine_x = {
            {
              "filetype",
              icon_only = true,
            },
            "progress",
            "location",
          },
          lualine_y = {},
          lualine_z = {},
        },
        inactive_sections = {
          lualine_c = {
            window_number,
            "filename",
          },
        },
        -- tabline = {
        --   lualine_a = {},
        --   lualine_b = {},
        --   lualine_c = {
        --     {
        --       "tabs",
        --       max_length = vim.o.columns - 10,
        --       mode = 2,
        --       path = 1,
        --       symbols = {
        --         modified = " •",
        --       },
        --     },
        --   },
        --   lualine_x = {},
        --   lualine_y = {},
        --   lualine_z = {},
        -- },
      }
    end,
  },
  {
    "echasnovski/mini.clue",
    lazy = true,
    version = false,
    keys = { "<leader>", '"', "'", "`", "g" },
    config = function()
      local miniclue = require("mini.clue")

      miniclue.setup({
        clues = {
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows(),
          -- miniclue.gen_clues.z(),
        },
        triggers = {
          { mode = "n", keys = "<leader>" },
          { mode = "n", keys = "g" },
          { mode = "x", keys = "g" },
          { mode = "n", keys = "'" },
          { mode = "n", keys = "`" },
          { mode = "x", keys = "'" },
          { mode = "x", keys = "`" },
          { mode = "n", keys = '"' },
          { mode = "x", keys = '"' },
          -- { mode = "n", keys = "z" },
          -- { mode = "x", keys = "z" },
        },
        window = {
          delay = 500,
        },
      })
    end,
  },
  {
    "j-hui/fidget.nvim",
    lazy = true,
    event = { "BufRead", "BufNewFile" },
    opts = {
      progress = {
        display = {
          progress_icon = {
            pattern = "dots",
            period = 1,
          },
        },
      },
      notification = {
        override_vim_notify = true,
        window = {
          winblend = 0,
        },
      },
    },
  },
  -- {
  --   "folke/noice.nvim",
  --   lazy = true,
  --   event = "VeryLazy",
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "rcarriga/nvim-notify",
  --   },
  --   opts = {
  --     lsp = {
  --       override = {
  --         ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
  --         ["vim.lsp.util.stylize_markdown"] = true,
  --         ["cmp.entry.get_documentation"] = true,
  --       },
  --     },
  --     presets = {
  --       bottom_search = true,
  --     },
  --     cmdline = {
  --       view = "cmdline",
  --     },
  --   },
  -- },
}
