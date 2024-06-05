-------------
-- IMPORTS --
-------------

require("gulbo.mappings")
require("gulbo.options")

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
    defaults = { lazy = true },
  }
)

-----------------
-- COLORSCHEME --
-----------------

vim.cmd.colorscheme("gruvbox-material")
