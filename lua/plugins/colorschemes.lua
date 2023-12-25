return {
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
        fidget = true,
        gitsigns = true,
        leap = true,
        lsp_trouble = true,
        mason = true,
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
