-- windows
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

vim.keymap.set('n', '<Leader>wh', '<C-w>h', { desc = 'Move to left window' })
vim.keymap.set('n', '<Leader>wl', '<C-w>l', { desc = 'Move to right window' })
vim.keymap.set('n', '<Leader>wk', '<C-w>k', { desc = 'Move to top window' })
vim.keymap.set('n', '<Leader>wj', '<C-w>j', { desc = 'Move to bottom window' })

-- not the greatest window resizing
vim.keymap.set('n', '<A-j>', '<cmd>resize +2<CR>')
vim.keymap.set('n', '<A-k>', '<cmd>resize -2<CR>')
vim.keymap.set('n', '<A-l>', '<cmd>vertical resize +2<CR>')
vim.keymap.set('n', '<A-h>', '<cmd>vertical resize -2<CR>')

vim.keymap.set('n', '<Leader>qq', '<cmd>quitall<CR>', { desc = 'Quit nvim' })

vim.keymap.set('n', '<Leader>fs', '<cmd>w<CR>', { desc = 'Save file' })

vim.keymap.set('n', '<Leader>sc', '<cmd>let @/ = ""<CR>', { desc = 'Clear highlight' })

vim.keymap.set('n', '<Leader>feR', '<cmd>source .config/nvim/init.lua<CR>', { desc = 'Reload nvim config' })

vim.keymap.set('n', '<Leader><Leader>', '<cmd>Telescope commands<CR>', { desc = "Commands" })

-- buffers
vim.keymap.set('n', '<Leader>bb', '<cmd>Telescope buffers<CR>', { desc = 'List buffers' })
vim.keymap.set('n', '<Leader>bd', '<cmd>Bdelete<CR>', { desc = 'Delete buffer' })
vim.keymap.set('n', '<Leader><Tab>', '<cmd>bnext<CR>', { desc = 'Next buffer' })

-- files
vim.keymap.set('n', '<Leader>fr', '<cmd>Telescope oldfiles<CR>', { desc = 'Recent files' })
vim.keymap.set('n', '<Leader>el', '<cmd>TroubleToggle<CR>', { desc = 'List problems' })

-- projects
vim.keymap.set('n', '<Leader>pp', '<cmd>Telescope projects<CR>', { desc = 'Recent projects' })
vim.keymap.set('n', '<Leader>pf', '<cmd>Telescope find_files<CR>', { desc = 'Project files' })

-- searching
vim.keymap.set('n', '<Leader>ss', '<cmd>Telescope current_buffer_fuzzy_find<CR>', { desc = 'Swoop buffer' })
vim.keymap.set('n', '<Leader>sp', '<cmd>Telescope live_grep<CR>', { desc = 'Search in project' })
vim.keymap.set('v', '<Leader>sp', '<cmd>Telescope grep_string<CR>', { desc = 'Search in project' }) -- note: it ignores selected text

-- git
vim.keymap.set('n', '<Leader>gs', '<cmd>Neogit<CR>', { desc = 'Status' })
vim.keymap.set('n', '<Leader>gS', '<cmd>Gitsigns stage_hunk<CR>', { desc = 'Stage hunk' })
vim.keymap.set('v', '<Leader>gS', '<esc><cmd>\'<,\'>Gitsigns stage_hunk<CR>gv', { desc = 'Stage hunk' })
vim.keymap.set('n', '<Leader>gu', '<cmd>Gitsigns undo_stage_hunk<CR>', { desc = 'Undo stage hunk' })

-- lsp
vim.keymap.set('n', '<LocalLeader>aa', '<cmd>lua vim.lsp.buf.code_action()<CR>', { desc = 'Code actions' })
vim.keymap.set('n', '<LocalLeader>==', '<cmd>lua vim.lsp.buf.format()<CR>', { desc = 'Format buffer' })
vim.keymap.set('n', '<LocalLeader>rr', '<cmd>lua vim.lsp.buf.rename()<CR>', { desc = 'Rename symbol' })
vim.keymap.set('n', '<LocalLeader>gg', '<cmd>lua vim.lsp.buf.definition()<CR>', { desc = 'Go to definition' })

-- misc formatting
vim.keymap.set('n', '<M-q>', 'gww', { desc = 'Wrap lines' })
vim.keymap.set('v', '<M-q>', 'gw', { desc = 'Wrap lines' })
-- Seemingly you can't bind to `;`, so we are stuck with `gcc` in normal and
-- `gc` in visual mode
-- vim.keymap.set('n', '<Leader>;;', 'gcc', { desc = 'Comment line' })

-- tree
vim.keymap.set('n', '<Leader>pt', '<cmd>NvimTreeFindFileToggle!<CR>', { desc = 'File tree' })

-- toggles
vim.keymap.set('n', '<Leader>Ts', '<cmd>set spell!<CR>', { desc = 'Spell checking' })

-- help
vim.keymap.set('n', '<Leader>hh', '<cmd>Telescope help_tags<CR>', { desc = 'Search help' })
