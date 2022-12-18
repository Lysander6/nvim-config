vim.keymap.set('n', '<Leader>1', '<cmd>1wincmd w<CR>', { desc = 'Switch to window 1' })
vim.keymap.set('n', '<Leader>2', '<cmd>2wincmd w<CR>', { desc = 'Switch to window 2' })
vim.keymap.set('n', '<Leader>3', '<cmd>3wincmd w<CR>', { desc = 'Switch to window 3' })
vim.keymap.set('n', '<Leader>4', '<cmd>4wincmd w<CR>', { desc = 'Switch to window 4' })
vim.keymap.set('n', '<Leader>5', '<cmd>5wincmd w<CR>', { desc = 'Switch to window 5' })
vim.keymap.set('n', '<Leader>6', '<cmd>6wincmd w<CR>', { desc = 'Switch to window 6' })

vim.keymap.set('n', '<Leader>wm', '<cmd>only<CR>', { desc = 'Maximize window' })
vim.keymap.set('n', '<Leader>w1', '<cmd>only<CR>', { desc = '1 column' })
-- only works when there are enough buffers to fill N columns, so not quite what I want
vim.keymap.set('n', '<Leader>w2', '<cmd>vertical 2sball<CR>', { desc = '2 columns' })
vim.keymap.set('n', '<Leader>w3', '<cmd>vertical 3sball<CR>', { desc = '3 columns' })

vim.keymap.set('n', '<Leader>ws', '<cmd>split<CR>', { desc = 'Split horizontally' })
vim.keymap.set('n', '<Leader>wS', '<cmd>split<CR><C-w>j', { desc = 'Split horizontally and switch' })
vim.keymap.set('n', '<Leader>wv', '<cmd>vsplit<CR>', { desc = 'Split vertically' })
vim.keymap.set('n', '<Leader>wV', '<cmd>vsplit<CR><C-w>l', { desc = 'Split vertically and switch' })

vim.keymap.set('n', '<Leader>wd', '<cmd>close<CR>', { desc = 'Close window' })

-- not the greatest window resizing
vim.keymap.set('n', '<A-j>', '<cmd>resize +2<CR>')
vim.keymap.set('n', '<A-k>', '<cmd>resize -2<CR>')
vim.keymap.set('n', '<A-l>', '<cmd>vertical resize +2<CR>')
vim.keymap.set('n', '<A-h>', '<cmd>vertical resize -2<CR>')

vim.keymap.set('n', '<Leader>qq', '<cmd>quitall<CR>', { desc = 'Quit nvim' })

vim.keymap.set('n', '<Leader>fs', '<cmd>w<CR>', { desc = 'Save file' })

vim.keymap.set('n', '<Leader>sc', '<cmd>let @/ = ""<CR>', { desc = 'Clear highlight' })

vim.keymap.set('n', '<Leader>feR', '<cmd>source .config/nvim/init.lua<CR>', { desc = 'Reload nvim config' })

vim.keymap.set('n', '<Leader><Leader>', '<cmd>Telescope commands theme=ivy<CR>', { desc = "Commands" })

-- buffers
vim.keymap.set('n', '<Leader>bb', '<cmd>Telescope buffers theme=ivy<CR>', { desc = 'List buffers' })
vim.keymap.set('n', '<Leader>bd', '<cmd>bdelete<CR>', { desc = 'Delete buffer' })

-- files
vim.keymap.set('n', '<Leader>fr', '<cmd>Telescope oldfiles theme=ivy<CR>', { desc = 'Recent files' })

-- projects
vim.keymap.set('n', '<Leader>pp', '<cmd>Telescope projects theme=ivy<CR>', { desc = 'Recent projects' })
