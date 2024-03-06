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

require("lazy").setup({
  -- tokyonight colorscheme
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
  },
  -- telescope fuzzy finder
  {
    "nvim-telescope/telescope.nvim",
    version = "0.1.2",
    dependencies = "nvim-lua/plenary.nvim",
  },
  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  -- r plugin
  {
    "jalvesaq/Nvim-R",
    branch = "stable",
  },
  -- tex plugin
  "lervag/vimtex",
  -- snippets
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
  },
  {
    "eigenfoo/stan-vim",
  },
})
