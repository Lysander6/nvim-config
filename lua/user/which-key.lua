local status_ok, which_key = pcall(require, 'which-key')
if not status_ok then
  return
end

which_key.setup {
  icons = {
    separator = '»'
  },
  plugins = {
    spelling = {
      enabled = true,
      suggestions = 20
    }
  },
  window = {
    margin = { 0, 0, 1, 0 },
    padding = { 1, 0, 1, 0 }
  }
}
