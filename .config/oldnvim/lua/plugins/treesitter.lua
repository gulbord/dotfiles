return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,
  config = function()
    require("nvim-treesitter.configs").setup({
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = {"markdown"},
      },
      ensure_installed = {
        --"c", "cpp", "latex", "lua", "markdown", "python",
        --"query", "r", "rnoweb", "vim", "vimdoc"
      },
      sync_install = false,
      auto_install = true,
    })
  end
}
