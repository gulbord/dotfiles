return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  config = function()
    require("nvim-treesitter.configs").setup({
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { "markdown" },
      },
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline",
      },
      sync_install = false,
      auto_install = false,
    })
  end,
}
