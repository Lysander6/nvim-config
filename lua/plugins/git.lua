return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    lazy = true,
    config = true,
    keys = {
      {
        "<leader>gs",
        "<cmd>Neogit kind=vsplit<cr>",
        mode = "n",
        desc = "Git status",
      },
    },
  },
}
