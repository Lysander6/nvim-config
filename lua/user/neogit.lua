local status_ok, neogit = pcall(require, 'neogit')
if not status_ok then
  return
end

neogit.setup {
  disable_hint = true,
  use_magit_keybindings = true,
  mappings = {
    status = {
      ['p'] = 'PushPopup',
      ['P'] = '',
    }
  }
}
