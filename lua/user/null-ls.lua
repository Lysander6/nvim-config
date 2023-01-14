local has_null_ls, null_ls = pcall(require, "null-ls")

if not has_null_ls then
  return
end

local gitsigns = null_ls.builtins.code_actions.gitsigns.with({
  config = {
    filter_actions = function(title)
      return title:lower():match("blame") == nil -- filter out blame actions
    end,
  },
})

-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md
null_ls.setup({
  sources = {
    gitsigns,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.diagnostics.todo_comments,
  },
})
