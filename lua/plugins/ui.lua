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
            {
              "mode",
              fmt = function(str)
                return str:sub(1, 1)
              end,
            },
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
            "diagnostics",
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
      }
    end,
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
