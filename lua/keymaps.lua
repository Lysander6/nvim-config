local map = vim.keymap.set

map("n", "<leader>qq", "<cmd>qall<cr>")
map("n", "<leader>fs", "<cmd>w<cr>")

-- window splitting
map("n", "<leader>ws", "<cmd>split<cr>")
map("n", "<leader>wv", "<cmd>vsplit<cr>")

-- window closing
map("n", "<leader>wd", "<cmd>close<cr>")
map("n", "<leader>wo", "<cmd>only<cr>")

-- window movement
map("n", "<leader>wk", "<cmd>wincmd k<cr>")
map("n", "<leader>wj", "<cmd>wincmd j<cr>")
map("n", "<leader>wh", "<cmd>wincmd h<cr>")
map("n", "<leader>wl", "<cmd>wincmd l<cr>")

-- rotate windows
map("n", "<leader>wr", "<cmd>wincmd r<cr>")

-- jump to nth window
for i = 1, 9 do
  map("n", "<leader>" .. i, "<cmd>" .. i .. " wincmd w<cr>")
end

-- go to second window
map("n", "<leader>w2", "<cmd>wincmd 2<cr>")

-- buffers
map("n", "<leader><tab>", "<cmd>e #<cr>")
map("n", "[b", "<cmd>bprevious<cr>")
map("n", "]b", "<cmd>bnext<cr>")
map("n", "<leader>bd", "<cmd>bd<cr>")

-- toggles
-- toggle spellcheck
map("n", "<leader>ts", "<cmd>set spell!<cr>")
-- toggle relative line numbers
map("n", "<leader>tr", "<cmd>set rnu!<cr>")
-- toggle paste mode
map("n", "<leader>tp", "<cmd>set paste!<cr>")
-- toggle highlight search
map("n", "<leader>sc", "<cmd>set hlsearch!<cr>")
-- toggle quickfix list
map("n", "<leader>el", "<cmd>copen<cr>")

-- lsp
map("n", "gd", function()
  require("telescope.builtin").lsp_definitions({ reuse_win = true })
end)
map("n", "gr", function()
  require("telescope.builtin").lsp_references({ reuse_win = true })
end)
map("n", "gD", vim.lsp.buf.declaration)
map("n", "gi", function()
  require("telescope.builtin").lsp_implementations({ reuse_win = true })
end)
map("n", "gy", function()
  require("telescope.builtin").lsp_type_definitions({ reuse_win = true })
end)
map("n", "K", vim.lsp.buf.hover)
map("n", "gK", vim.lsp.buf.signature_help)
map("n", "<localleader>aa", vim.lsp.buf.code_action)
map("n", "<localleader>rr", vim.lsp.buf.rename)
