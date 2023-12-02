return {
  {
    "rmagatti/auto-session",
    lazy = true,
    keys = {
      {
        "<leader>qr",
        "<cmd>SessionRestore<cr>",
        desc = "Restore session",
      },
      { "<leader>qs", "<cmd>SessionSave<cr>", desc = "Save session" },
      { "<leader>qd", "<cmd>SessionDelete<cr>", desc = "Delete session" },
    },
    opts = {
      log_level = "error",
    },
  },
}
