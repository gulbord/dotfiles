-------------
-- IMPORTS --
-------------

require("gulbo.mappings")
require("gulbo.options")
require("gulbo.autocmds")

----------------
-- LAZY SETUP --
----------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
  "plugins",
  {
    defaults = { lazy = false },
  }
)

local lspconfig = require("lspconfig")
lspconfig.typst_lsp.setup({})
lspconfig.tinymist.setup({
  single_file_support = true,
  settings = {
    exportPdf = "onType",
    formatterMode = "typstyle",
    formatterPrintWidth = 80,
  },
})

-----------------
-- COLORSCHEME --
-----------------

vim.cmd.colorscheme("everforest")
