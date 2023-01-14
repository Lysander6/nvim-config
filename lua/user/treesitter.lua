local has_treesitter, treesitter = pcall(require, "nvim-treesitter.configs")

if not has_treesitter then
  return
end

treesitter.setup({
  ensure_installed = {
    "html",
    "javascript",
    "lua",
    "markdown",
    "markdown_inline",
  },
  highlight = {
    enable = true,
  },
  playground = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
  },
})

-- jqtpl dev stuff
local jqtpl_parser_dir = "~/projects/tree-sitter-jqtpl"

-- Note that neither :TSInstall nor :TSInstallFromGrammar copy query files from
-- the grammar repository. If you want your installed grammar to be useful, you
-- must manually add query files to your local nvim-treesitter installation.
-- https://github.com/nvim-treesitter/nvim-treesitter/#adding-queries
--
-- ❯ mkdir ~/.asdf/installs/neovim/nightly/share/nvim/runtime/queries/jqtpl
-- ❯ cp queries/highlights.scm ~/.asdf/installs/neovim/nightly/share/nvim/runtime/queries/jqtpl/
-- ❯ cp queries/injections.scm ~/.asdf/installs/neovim/nightly/share/nvim/runtime/queries/jqtpl/
-- ❯ cp queries/locals.scm ~/.asdf/installs/neovim/nightly/share/nvim/runtime/queries/jqtpl/

if vim.fn.empty(vim.fn.glob(jqtpl_parser_dir)) == 0 then
  local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

  parser_config.jqtpl = {
    install_info = {
      url = jqtpl_parser_dir,
      files = { "src/parser.c" },
    },
  }

  vim.filetype.add({
    extension = {
      jqtpl = "jqtpl",
    },
  })
else
  vim.filetype.add({
    extension = {
      jqtpl = "html",
    },
  })
end
