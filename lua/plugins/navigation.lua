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
  {
    "echasnovski/mini.bufremove",
    lazy = true,
    version = false,
    keys = {
      {
        "<leader>bd",
        function()
          local bd = require("mini.bufremove").delete
          if vim.bo.modified then
            local choice = vim.fn.confirm(
              ("Save the changes to %q?"):format(vim.fn.bufname()),
              "&Yes\n&No\nCancel"
            )
            if choice == 1 then
              vim.cmd.write()
              bd(0)
            elseif choice == 2 then
              bd(0, true)
            end
          else
            bd(0)
          end
        end,
        desc = "Delete buffer",
      },
    },
    config = true,
  },
}
