local status_ok, neogit = pcall(require, 'neogit')
if not status_ok then
  return
end

neogit.setup {
  disable_hint = true,
  kind = 'vsplit',
  -- Having both `use_magit_keybindings = true` and changed status popup
  -- mappings is kind of broken. Help popup will show wrong keys, but 'p' will
  -- mean push and 'F' pull like in magit.
  -- use_magit_keybindings = true,
  mappings = {
    status = {
      ['F'] = 'PullPopup',
      ['p'] = 'PushPopup',
      ['P'] = '',
    }
  }
}
