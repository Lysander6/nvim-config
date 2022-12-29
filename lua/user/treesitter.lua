local status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
end

treesitter.setup {
  ensure_installed = {
    'clojure',
    'html',
    'javascript',
    'query', -- for `nvim-treesitter/playground`
    'lua',
    'markdown',
    'markdown_inline',
  },
  highlight = {
    enable = true
  },
  playground = {
    enable = true
  },
  rainbow = { -- nvim-ts-rainbow
    enable = true,
    extended_mode = true
  }
}

-- jqtpl dev stuff
local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
parser_config.jqtpl = {
  install_info = {
    url = '~/projects/tree-sitter-jqtpl',
    files = { 'src/parser.c' }
  }
}

vim.filetype.add({
  extension = {
    jqtpl = 'jqtpl'
  }
})
