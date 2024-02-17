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
      filesystem = {
        filtered_items = {
          hide_dotfiles = false,
        },
        hijack_netrw_behavior = "open_current",
      },
      document_symbols = {
        follow_cursor = true,
      },
      sources = {
        "filesystem",
        "buffers",
        "git_status",
        "document_symbols",
      },
      source_selector = {
        winbar = true,
        sources = {
          { source = "filesystem" },
          { source = "buffers" },
          -- { source = "git_status" },
          { source = "document_symbols" },
        },
      },
      window = {
        mappings = {
          ["<tab>"] = "toggle_node",
          ["h"] = "close_node",
          ["l"] = "open",
          ["<C-h>"] = "prev_source",
          ["<C-l>"] = "next_source",
          ["P"] = {
            "toggle_preview",
            config = {
              -- reuse window for preview
              use_float = false,
            },
          },
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
      {
        "<leader>ps",
        "<cmd>Neotree document_symbols toggle reveal<cr>",
        mode = "",
        desc = "Toggle NeoTree document symbols",
      },
    },
    init = function()
      if vim.fn.argc(-1) == 1 then
        if vim.fn.isdirectory(vim.fn.expand("%")) == 1 then
          require("neo-tree")
        end
      end
    end,
  },
  {
    "echasnovski/mini.bufremove",
    lazy = true,
    version = false,
    keys = {
      {
        "<leader>bd",
        function()
          local bd = require("mini.bufremove").wipeout
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
