return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("tokyonight").setup({
      style = "night",
      terminal_colors = true,
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
      },
    })
  end
}
