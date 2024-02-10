return {
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    opts = {
      color_overrides = {
        mocha = {
          -- original
          -- base = "#1e1e2e",
          -- mantle = "#181825",
          -- crust = "#11111B",
          --
          -- darker
          base = "#1A1A28",
          mantle = "#14141F",
          crust = "#0E0E16",
        },
      },
      dim_inactive = {
        enabled = true,
      },
      integrations = {
        cmp = true,
        fidget = true,
        gitsigns = true,
        leap = true,
        lsp_trouble = true,
        mason = true,
        native_lsp = {
          enabled = true,
          inlay_hints = {
            background = false,
          },
        },
        neogit = true,
        neotree = true,
        noice = true,
        telescope = {
          enabled = true,
        },
        treesitter = true,
        treesitter_context = true,
      },
      styles = {
        comments = {},
        conditionals = {},
      },
      custom_highlights = function(colors)
        return {
          Folded = { bg = colors.none, fg = colors.overlay0, style = {} },
          Visual = { bg = colors.surface1, style = {} },
          VisualNOS = { bg = colors.surface1, style = {} },
        }
      end,
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin")
    end,
  },
}
