return {
  {
    "windwp/nvim-autopairs",
    lazy = true,
    event = "InsertEnter",
    opts = {},
  },
  {
    "ggandor/leap.nvim",
    lazy = true,
    keys = {
      { "s", mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "S", mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "x", mode = { "x", "o" }, desc = "Leap forward to" },
      { "X", mode = { "x", "o" }, desc = "Leap backward to" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },
    config = function(_, opts)
      require("leap").add_default_mappings()
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    lazy = true,
    version = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
      "nvim-tree/nvim-web-devicons",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    opts = {
      color_devicons = true,
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
      pickers = {
        spell_suggest = {
          theme = "cursor",
        },
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      opts.defaults = require("telescope.themes").get_ivy({
        prompt_prefix = " ",
        selection_caret = " ",
        mappings = {
          i = {
            ["<esc>"] = "close",
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
          },
        },
      })
      opts.extensions["ui-select"] = {
        require("telescope.themes").get_cursor({
          mappings = {
            i = {
              ["<esc>"] = "close",
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
            },
          },
        }),
      }
      telescope.setup(opts)

      telescope.load_extension("fzf")
      telescope.load_extension("ui-select")
    end,
    keys = {
      { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      { "<leader>pf", "<cmd>Telescope find_files<cr>", desc = "Find file" },
      { "<leader>bb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
      {
        "<leader>sp",
        "<cmd>Telescope grep_string<cr>",
        desc = "Find in project",
      },
      { "<M-s>r", "<cmd>Telescope live_grep<cr>", desc = "Ripgrep" },
      { "<leader><leader>", "<cmd>Telescope commands<cr>", desc = "Commands" },
      { "z=", "<cmd>Telescope spell_suggest<cr>", desc = "Spelling" },
    },
  },
  {
    "folke/trouble.nvim",
    lazy = true,
    cmd = { "TroubleToggle", "Trouble" },
    opts = {
      use_diagnostic_signs = true,
    },
    keys = {
      {
        "<leader>el",
        "<cmd>TroubleToggle document_diagnostics<cr>",
        desc = "Document diagnostics",
      },
      {
        "<leader>pe",
        "<cmd>TroubleToggle workspace_diagnostics<cr>",
        desc = "Workspace diagnostics",
      },
    },
  },
  {
    "numToStr/Comment.nvim",
    lazy = true,
    event = { "BufRead", "BufNewFile" },
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      "nvim-treesitter/nvim-treesitter",
    },
    init = function()
      vim.g.skip_ts_context_commentstring_module = true
    end,
    config = function(_, opts)
      opts.pre_hook = require(
        "ts_context_commentstring.integrations.comment_nvim"
      ).create_pre_hook()

      require("Comment").setup(opts)
    end,
  },
}
