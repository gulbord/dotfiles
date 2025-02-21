return {
  "R-nvim/R.nvim",
  lazy = false,
  config = function()
    ---@type RConfigUserOpts
    local opts = {
      hook = {
        on_filetype = function()
          vim.g.r_indent_align_args = 0
          vim.g.r_indent_ess_comments = 0
          vim.g.r_indent_ess_compatible = 0
          vim.keymap.set(
            "n",
            "<C-CR>",
            "<plug>RDSendLine",
            { buffer = true, desc = "Send line to R console" }
          )
          vim.keymap.set(
            "v",
            "<C-CR>",
            "<plug>RDSendSelection",
            { buffer = true, desc = "Send selection to R console" }
          )
          vim.keymap.set(
            "i",
            "<C-,>",
            "<Plug>RInsertAssign",
            { buffer = true, desc = "Insert <-" }
          )
          vim.keymap.set(
            "i",
            "<M-->",
            "<Plug>RmdInsertChunk",
            { buffer = true, desc = "Insert Rmd chunk" }
          )
        end,
      },
      R_args = { "--quiet", "--no-save" },
      R_app = "R",
      auto_start = "no",
      open_html = "no",
    }
    require("r").setup(opts)
  end,
}
