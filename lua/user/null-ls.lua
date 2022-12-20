local status_ok, null_ls = pcall(require, 'null-ls')
if not status_ok then
  return
end

null_ls.setup {
  sources = {
    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.completion.spell, -- might get annoying
    null_ls.builtins.diagnostics.todo_comments,
    null_ls.builtins.formatting.jq,
  }
}
