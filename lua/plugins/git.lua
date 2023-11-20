return {
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    lazy = true,
    opts = {
      disable_context_highlighting = true,
      disable_hint = true,
      signs = {
        hunk = { "", "" },
        item = { "", "" },
        section = { "", "" },
      },
      mappings = {
        popup = {
          ["F"] = "PullPopup",
          ["p"] = "PushPopup",
        },
      },
    },
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
