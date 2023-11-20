return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    lazy = true,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      window = {
        mappings = {
          ["<tab>"] = "open",
        },
      },
    },
    cmd = "Neotree",
    keys = {
      {
        "<leader>pt",
        "<cmd>Neotree toggle reveal<cr>",
        mode = "",
        desc = "Toggle NeoTree",
      },
    },
  },
}
