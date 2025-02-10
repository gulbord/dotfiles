local set = vim.opt

set.number = true
set.relativenumber = true
set.mouse = "a"

-- Both need to be true to have smartcase
set.ignorecase = true
set.smartcase = true

set.splitbelow = true
set.cursorline = true

set.textwidth = 80
set.expandtab = true
set.tabstop = 2
set.softtabstop = -1
set.shiftwidth = 0

set.termguicolors = true

set.foldenable = false

-- Diagnostics configuration
set.signcolumn = "number"
vim.diagnostic.config({
  update_in_insert = false,
  virtual_text = false,
  signs = true,
  float = {
    format = function(dgn)
      return string.format(
        "%s (%s) [%s]",
        dgn.message,
        dgn.source,
        dgn.code or dgn.user_data.lsp.code
      )
    end,
  },
})
