return {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "macchiato",
      background = {
        light = "latte",
        dark = "macchiato",
      },
      term_colors = true,
      no_italic = true,
    })
  end
}
