return {
  {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      require("mason-lspconfig").setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
          })
        end,
      })

      -- make lua_ls aware of `vim` global
      -- https://github.com/neovim/neovim/issues/21686#issuecomment-1522446128
      require("lspconfig").lua_ls.setup({
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            diagnostics = {
              globals = {
                "vim",
              },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
            },
            telemetry = {
              enable = false,
            },
          },
        },
      })
      require("lspconfig").rust_analyzer.setup({
        capabilities = capabilities,
      })
      require("lspconfig").tsserver.setup({
        capabilities = capabilities,
      })

      -- define custom lsp diagnostic signs
      vim.fn.sign_define("DiagnosticSignError", {
        text = "",
        texthl = "DiagnosticSignError",
      })
      vim.fn.sign_define("DiagnosticSignWarn", {
        text = "",
        texthl = "DiagnosticSignWarn",
      })
      vim.fn.sign_define("DisgnosticSignInfo", {
        text = "",
        texthl = "DiagnosticSignInfo",
      })
      vim.fn.sign_define("DiagnosticSignHint", {
        text = "",
        texthl = "DiagnosticSignHint",
      })
    end,
  },
  {
    "williamboman/mason.nvim",
    lazy = true,
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = true,
    dependencies = {
      "williamboman/mason.nvim",
    },
    opts = {
      ensure_installed = {
        "lua_ls",
      },
    },
  },
}
