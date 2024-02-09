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
        capabilities = capabilities,
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
        settings = {
          ["rust-analyzer"] = {
            checkOnSave = {
              command = "clippy",
              extraArgs = {
                -- "--all",
                "--",
                "-Wclippy::pedantic",
                "-Wclippy::perf",
              },
            },
            inlayHints = {
              maxLength = 120,
              -- bindingModeHints = {
              --   enable = true,
              -- },
              -- closureCaptureHints = {
              --   enable = true,
              -- },
              closureReturnTypeHints = {
                enable = true,
              },
              lifetimeElisionHints = {
                enable = true,
                useParameterNames = true,
              },
              implicitDrops = {
                enable = true,
              },
              -- reborrowHints = {
              --   enable = true,
              -- },
            },
          },
        },
        on_attach = function(client, bufnr)
          vim.lsp.inlay_hint.enable(bufnr, true) -- seems to not draw hints on first screen
        end,
      })
      require("lspconfig").tsserver.setup({
        capabilities = capabilities,
        settings = {
          typescript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayVariableTypeHintsWhenTypeMatchesName = false,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
          javascript = {
            inlayHints = {
              includeInlayParameterNameHints = "all",
              includeInlayParameterNameHintsWhenArgumentMatchesName = false,
              includeInlayFunctionParameterTypeHints = true,
              includeInlayVariableTypeHints = true,
              includeInlayVariableTypeHintsWhenTypeMatchesName = false,
              includeInlayPropertyDeclarationTypeHints = true,
              includeInlayFunctionLikeReturnTypeHints = true,
              includeInlayEnumMemberValueHints = true,
            },
          },
        },
        on_attach = function(client, bufnr)
          vim.lsp.inlay_hint.enable(bufnr, true)
        end,
      })
      require("lspconfig").eslint.setup({
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          vim.api.nvim_create_autocmd("BufWritePre", {
            buffer = bufnr,
            command = "EslintFixAll",
          })
        end,
      })
      require("lspconfig").graphql.setup({
        filetypes = {
          "graphql",
          "typescript",
          "javascript",
          "typescriptreact",
          "javascriptreact",
        },
      })
      require("lspconfig").gdscript.setup({
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
      vim.fn.sign_define("DiagnosticSignInfo", {
        text = "",
        texthl = "DiagnosticSignInfo",
      })
      vim.fn.sign_define("DiagnosticSignHint", {
        text = "",
        texthl = "DiagnosticSignHint",
      })

      -- highlight symbol under cursor
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(ev)
          if
            #vim.lsp.get_clients({
              bufnr = ev.buf,
              method = "textDocument/documentHighlight",
            }) == 0
          then
            return
          end

          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = ev.buf,
            callback = function()
              vim.lsp.buf.document_highlight()
            end,
            desc = "Highlight symbol under cursor",
          })
          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = ev.buf,
            callback = function()
              vim.lsp.buf.clear_references()
            end,
            desc = "Clear symbol highlights",
          })
        end,
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
        "eslint",
        "lua_ls",
        "typos_lsp",
      },
    },
  },
}
