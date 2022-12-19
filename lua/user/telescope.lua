local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
  return
end

telescope.setup {
  defaults = require('telescope.themes').get_ivy({
    preview = false
  })
}

