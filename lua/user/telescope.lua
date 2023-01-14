local has_telescope, telescope = pcall(require, "telescope")

if not has_telescope then
  return
end

local default_pickers_opts = {
  theme = "ivy"
}

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-h>"] = "which_key",
      },
    },
  },
  pickers = {
    buffers = default_pickers_opts,
    find_files = default_pickers_opts,
    grep_string = default_pickers_opts,
    live_grep = default_pickers_opts,
  },
})

local builtin = require("telescope.builtin")

vim.keymap.set("n", "<Leader>bb", builtin.buffers)
vim.keymap.set("n", "<Leader>ff", builtin.find_files)
vim.keymap.set("n", "<Leader>pf", builtin.find_files)
vim.keymap.set("n", "<Leader>sp", builtin.grep_string)
vim.keymap.set("n", "<Leader>fh", builtin.help_tags)
vim.keymap.set("n", "<Leader>ss", builtin.live_grep)
vim.keymap.set("n", "<Leader>fr", builtin.oldfiles)
