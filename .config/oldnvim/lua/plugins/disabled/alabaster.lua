return {
  url = "https://git.sr.ht/~p00f/alabaster.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    vim.g.alabaster_dim_comments = true
    vim.cmd.colorscheme("alabaster")
  end
}
