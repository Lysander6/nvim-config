return {
  {
    "nvim-treesitter/nvim-treesitter",
    version = false,
    lazy = true,
    build = ":TSUpdate",
    event = "BufReadPre",
    dependencies = {
      {
        "nvim-treesitter/nvim-treesitter-textobjects",
        version = false,
      },
      "windwp/nvim-ts-autotag",
    },
    cmd = { "TSInstall", "TSUpdate", "TSUpdateSync" },
    opts = {
      ensure_installed = {
        "astro",
        "bash",
        "css",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "python",
        "query",
        "regex",
        "rust",
        "scss",
        "sql",
        "tsx",
        "typescript",
        "vim",
        "vimdoc",
        "yaml",
      },
      autotag = {
        enable = true,
      },
      highlight = {
        enable = true,
        disable = { "lua" },
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<leader>v",
          node_incremental = "v",
          scope_incremental = false,
          node_decremental = "V",
        },
      },
      -- NOTE: breaks indentation of markdown list items but gives better
      -- indentation in tsx. Optionally make it toggle based on file type
      indent = {
        enable = true,
      },
      textobjects = {
        lsp_interop = {
          enable = true,
          floating_preview_opts = {
            border = "rounded",
          },
          peek_definition_code = {
            ["<leader>df"] = "@function.outer",
            ["<leader>dF"] = "@class.outer",
          },
        },
      },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
}
