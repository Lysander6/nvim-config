local has_tokyonight, tokyonight = pcall(require, "tokyonight")

if not has_tokyonight then
  return
end

tokyonight.setup({
  on_colors = function(c)
    c.gitSigns.add = c.green
    c.gitSigns.change = c.orange
  end,
  on_highlights = function(hl, c)
    hl.CursorLineNr.fg = c.orange
  end,
})

vim.cmd.colorscheme("tokyonight-night")
