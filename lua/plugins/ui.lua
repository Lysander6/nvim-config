return {
  {
    "nvim-lualine/lualine.nvim",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "AndreM222/copilot-lualine",
    },
    opts = function()
      local lualine_require = require("lualine_require")
      lualine_require.require = require

      local window_number = {
        function()
          return vim.fn.winnr()
        end,
      }

      -- local treesitter = require("nvim-treesitter")
      --
      -- local treesitter_node = {
      --   function()
      --     return treesitter.statusline({
      --       type_patterns = {
      --         "class",
      --         "function",
      --         "method",
      --         "interface",
      --         "type",
      --         "var",
      --         "variable",
      --       },
      --     })
      --   end,
      -- }

      return {
        options = {
          component_separators = "",
          section_separators = "",
          disabled_filetypes = {
            "neo-tree",
            -- "Trouble",
          },
          theme = "catppuccin",
        },
        sections = {
          lualine_a = {
            window_number,
          },
          lualine_b = {},
          lualine_c = {
            {
              "filename",
              file_status = false,
              path = 1,
            },
            {
              -- coloured file status
              function()
                if vim.bo.modified then
                  return "•"
                end
                if vim.bo.readonly then
                  return ""
                end
                return ""
              end,
              color = function()
                if vim.bo.readonly then
                  return "WarningMsg"
                end
                if vim.bo.modified then
                  return { fg = "#f9e2af" }
                end
              end,
              padding = { left = 0, right = 1 },
            },
            {
              "searchcount",
              icon = "",
              color = {
                bg = "#F9E2AF",
                fg = "#000000",
              },
            },
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
            -- treesitter_node,
          },
          lualine_x = {
            {
              "copilot",
              show_colors = true,
              symbols = {
                status = {
                  hl = {
                    enabled = "#74c7ec",
                    sleep = "#74c7ec", -- cmp integration makes it appear "asleep", but in fact it is "enabled"
                  },
                },
              },
            },
            "progress",
            -- {
            --   function()
            --     local current = vim.fn.line(".")
            --     local total = vim.fn.line("$")
            --     local idx = math.ceil(current / total * 8) -- [1, 8] as indexing is 1-based
            --     local symbols = {
            --       "▔",
            --       "🭶",
            --       "🭷",
            --       "🭸",
            --       "🭹",
            --       "🭺",
            --       "🭻",
            --       "▁",
            --     }
            --     return symbols[idx]
            --   end,
            -- },
            "location",
          },
          lualine_y = {},
          lualine_z = {},
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {
            window_number,
            -- "branch", -- seems to be kind of broken
            {
              "filename",
              path = 1,
              symbols = {
                modified = "•",
                readonly = "",
              },
            },
          },
          lualine_x = {
            "location",
          },
          lualine_y = {},
          lualine_z = {},
        },
        tabline = {
          lualine_a = {},
          lualine_b = {
            {
              "tabs",
              cond = function()
                return vim.fn.tabpagenr("$") > 1
              end,
              max_length = vim.o.columns - 10,
              mode = 2,
              path = 1,
              symbols = {
                modified = " •",
              },
            },
          },
          lualine_c = {},
          lualine_x = {
            "branch",
          },
          lualine_y = {},
          lualine_z = {},
        },
      }
    end,
  },
  {
    "echasnovski/mini.clue",
    lazy = true,
    version = false,
    keys = {
      "<leader>",
      "<localleader>",
      { "<C-r>", mode = "i" },
      { "<C-r>", mode = "c" },
      { "<C-w>", mode = "n" },
      { "<C-x>", mode = "i" },
      '"',
      "'",
      "`",
      "g",
      "z",
    },
    config = function()
      local miniclue = require("mini.clue")

      miniclue.setup({
        clues = {
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers({
            -- show_contents = true,
          }),
          miniclue.gen_clues.windows({
            submode_move = true,
            submode_navigate = true,
            submode_resize = true,
          }),
          miniclue.gen_clues.z(),
        },
        triggers = {
          { mode = "n", keys = "<leader>" },
          { mode = "n", keys = "<localleader>" },
          { mode = "i", keys = "<C-r>" },
          { mode = "c", keys = "<C-r>" },
          { mode = "n", keys = "<C-w>" },
          { mode = "i", keys = "<C-x>" },
          { mode = "n", keys = "g" },
          { mode = "x", keys = "g" },
          { mode = "n", keys = "'" },
          { mode = "n", keys = "`" },
          { mode = "x", keys = "'" },
          { mode = "x", keys = "`" },
          { mode = "n", keys = '"' },
          { mode = "x", keys = '"' },
          { mode = "n", keys = "z" },
          { mode = "x", keys = "z" },
        },
        window = {
          config = {
            width = "auto",
          },
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
