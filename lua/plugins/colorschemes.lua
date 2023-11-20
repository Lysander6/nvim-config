return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    -- priority = 1000,
    opts = {},
    config = function(_, opts)
      vim.cmd([[colorscheme tokyonight-night]])
    end,
  },
  {
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    opts = {
      dim_inactive = {
        enabled = true,
      },
      integrations = {
        cmp = true,
        leap = true,
        neogit = true,
        telescope = {
          enabled = true,
        },
      },
      styles = {
        comments = {},
        conditionals = {},
      },
      custom_highlights = function(colors)
        return {
          Visual = { bg = colors.surface1, style = {} },
          VisualNOS = { bg = colors.surface1, style = {} },
        }
      end,
    },
    config = function(_, opts)
      require("catppuccin").setup(opts)
      vim.cmd([[colorscheme catppuccin]])
    end,
  },
}
