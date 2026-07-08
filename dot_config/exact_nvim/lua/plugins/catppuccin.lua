return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  term_colors = true,
  config = function()
    require("catppuccin").setup({
      flavour = "mocha", -- latte, frappe, macchiato, mocha
      transparent_background = true,
    })
-- Load the colorscheme
  vim.cmd.colorscheme "catppuccin-nvim"
  end,
}
