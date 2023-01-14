local has_lualine, lualine = pcall(require, "lualine")

if not has_lualine then
  return
end

lualine.setup({
  options = {
    component_separators = "",
    section_separators = "",
    disabled_filetypes = {
      "Trouble",
    },
    theme = "auto",
  },
  sections = {
    lualine_a = {
      {
        "mode",
        fmt = function(str)
          return str:sub(1, 1)
        end,
      },
    },
    lualine_b = {},
    lualine_c = {"branch", "diff", "diagnostics", "searchcount", "filename"},
    lualine_x = {"filetype", "progress", "location"},
    lualine_y = {},
    lualine_z = {},
  },
})
