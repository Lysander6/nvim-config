local map = vim.keymap.set

map("n", "<leader>qq", "<cmd>qall<cr>", { desc = "Quit all" })
map("n", "<leader>fs", "<cmd>w<cr>", { desc = "Save file" })

-- window splitting
map("n", "<leader>ws", "<cmd>split<cr>", { desc = "Split window" })
map("n", "<leader>wv", "<cmd>vsplit<cr>", { desc = "Split window vertically" })

-- window closing
map("n", "<leader>wd", "<cmd>close<cr>", { desc = "Delete window" })
map("n", "<leader>wo", "<cmd>only<cr>", { desc = "Close all other windows" })

-- window movement
map("n", "<leader>wk", "<cmd>wincmd k<cr>", { desc = "Move to window above" })
map("n", "<leader>wj", "<cmd>wincmd j<cr>", { desc = "Move to window below" })
map("n", "<leader>wh", "<cmd>wincmd h<cr>", { desc = "Move to window left" })
map("n", "<leader>wl", "<cmd>wincmd l<cr>", { desc = "Move to window right" })

-- rotate windows
map("n", "<leader>wr", "<cmd>wincmd r<cr>", { desc = "Rotate windows" })

-- jump to nth window
for i = 1, 9 do
  map(
    "n",
    "<leader>" .. i,
    "<cmd>" .. i .. " wincmd w<cr>",
    { desc = "Go to window " .. i }
  )
end

map("n", "<leader>ww", "<cmd>wincmd w<cr>", { desc = "Go to previous window" })

-- buffers
map("n", "<leader><tab>", "<cmd>b#<cr>", { desc = "Switch to previous buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Previous buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" })
-- map("n", "<leader>bd", "<cmd>bd<cr>")

-- tabs
map("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "New tab" })
map("n", "<leader>td", "<cmd>tabclose<cr>", { desc = "Delete tab" })
map("n", "]t", "<cmd>tabnext<cr>", { desc = "Next tab" })
map("n", "[t", "<cmd>tabprevious<cr>", { desc = "Previous tab" })
map("n", "<leader>t[", "<cmd>-tabmove<cr>", { desc = "Move tab left" })
map("n", "<leader>t]", "<cmd>+tabmove<cr>", { desc = "Move tab right" })
-- jump to nth tab
for i = 1, 9 do
  map(
    "n",
    "<leader>t" .. i,
    "<cmd>" .. i .. "tabnext<cr>",
    { desc = "Go to tab " .. i }
  )
end

-- toggles
-- toggle spellcheck
map("n", "<leader>ts", "<cmd>set spell!<cr>", { desc = "Toggle spellcheck" })
-- toggle relative line numbers
map(
  "n",
  "<leader>tr",
  "<cmd>set rnu!<cr>",
  { desc = "Toggle relative numbers" }
)
-- toggle paste mode
map("n", "<leader>tp", "<cmd>set paste!<cr>", { desc = "Toggle paste mode" })
-- toggle highlight search
map(
  "n",
  "<leader>sc",
  "<cmd>set hlsearch!<cr>",
  { desc = "Toggle search highlight" }
)
-- toggle quickfix list
-- map("n", "<leader>el", "<cmd>copen<cr>")
-- toggle inlay hints
map("n", "<leader>ti", function()
  vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle inlay hints" })

-- toggle lsp diagnostics
map("n", "<leader>te", function()
  if vim.diagnostic.is_disabled(0) then
    vim.diagnostic.enable(0)
  else
    vim.diagnostic.disable(0)
  end
end, { desc = "Toggle diagnostics" })

-- lsp
map("n", "gd", function()
  require("telescope.builtin").lsp_definitions({ reuse_win = true })
end, { desc = "Go to definition" })
map("n", "gr", function()
  require("telescope.builtin").lsp_references({ reuse_win = true })
end, { desc = "Go to references" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
map("n", "gi", function()
  require("telescope.builtin").lsp_implementations({ reuse_win = true })
end, { desc = "Go to implementation" })
map("n", "gy", function()
  require("telescope.builtin").lsp_type_definitions({ reuse_win = true })
end, { desc = "Go to type definition" })
map("n", "K", vim.lsp.buf.hover, { desc = "Show hover" })
map("n", "gK", vim.lsp.buf.signature_help, { desc = "Show signature help" })
map("n", "<localleader>aa", vim.lsp.buf.code_action, { desc = "Code action" })
map("n", "<localleader>rr", vim.lsp.buf.rename, { desc = "Rename" })
