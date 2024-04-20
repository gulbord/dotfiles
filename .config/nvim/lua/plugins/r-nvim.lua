return {
  "R-nvim/R.nvim",
  lazy = false,
  config = function()
    local opts = {
      R_args = {"--quiet", "--no-save"},
      assign_map = "<C-,>",
      help_w = 40,
      auto_start = "no",
      open_html = "no",
      rmdchunk = "`r",
    }

    require("r").setup(opts)

    vim.g.r_indent_align_args = 0
    vim.g.r_indent_ess_comments = 0
    vim.g.r_indent_ess_compatible = 0
  end
}
