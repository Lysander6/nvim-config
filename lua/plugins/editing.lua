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
        buffers = {
          path_display = { "smart" },
        },
        live_grep = {
          -- additional_args = { "--trim" },
        },
      },
    },
    config = function(_, opts)
      local telescope = require("telescope")
      opts.defaults = require("telescope.themes").get_ivy({
        prompt_prefix = " ",
        selection_caret = " ",
        multi_icon = "•",
        mappings = {
          i = {
            ["<esc>"] = "close",
            ["<C-j>"] = "move_selection_next",
            ["<C-k>"] = "move_selection_previous",
          },
        },
        cache_picker = {
          num_pickers = 20,
        },
        -- Format path as "file.txt (path\to\file\)"
        -- path_display = function(opts, path)
        --   local tail = require("telescope.utils").path_tail(path)
        --   return string.format("%s (%s)", tail, path)
        -- end,
        layout_config = {
          height = 10,
        },
        border = false,
        preview = false, -- NOTE: breaks git related pickers
        results_title = false,
        scroll_strategy = "limit",
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
    -- <C-/> - show input map in insert mode
    -- <C-SPC> - refine search
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
      { "<leader>hk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps" },
      {
        "<leader>sl",
        "<cmd>Telescope resume<cr>",
        desc = "Resume last search",
      },
      {
        "<leader>sL",
        "<cmd>Telescope pickers<cr>",
        desc = "List previous searches",
      },
      {
        "<leader>hh",
        "<cmd>Telescope help_tags<cr>",
        desc = "Search help",
      },
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
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      "nvim-treesitter/nvim-treesitter",
    },
    keys = {
      {
        "gc",
        mode = { "n", "v" },
        desc = "Comment lines",
      },
      {
        "gb",
        mode = { "n", "v" },
        desc = "Comment block",
      },
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
  {
    "kylechui/nvim-surround",
    lazy = true,
    keys = {
      { "c", mode = { "n", "v", "o" }, desc = "Change surround" },
      { "d", mode = { "n", "v", "o" }, desc = "Delete surround" },
      { "y", mode = { "n", "v", "o" }, desc = "Yank surround" },
    },
    config = true,
  },
}
