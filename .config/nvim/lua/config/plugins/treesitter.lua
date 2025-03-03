return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    ---@diagnostic disable-next-line: missing-fields
    require("nvim-treesitter.configs").setup({
      -- The listed parsers MUST always be installed
      ensure_installed = {
        "c",
        "lua",
        "vim",
        "vimdoc",
        "query",
        "markdown",
        "markdown_inline",
      },
      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,
      -- Automatically install missing parsers when entering buffer
      auto_install = false,
      -- List of parsers to ignore installing (or "all")
      highlight = {
        enable = true,
        disable = function(lang, buf)
          if lang == "latex" then
            return true
          end
          local max_filesize = 100 * 1024 -- 100 kB
          local ok, stats =
            pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
          if ok and stats and stats.size > max_filesize then
            return true
          end
        end,
        additional_vim_regex_highlighting = { "markdown" },
      },
    })

    vim.api.nvim_create_autocmd("FileType", {
      callback = function()
        if require("nvim-treesitter.parsers").has_parser() then
          vim.opt.foldmethod = "expr"
          vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
        else
          vim.opt.foldmethod = "syntax"
        end
      end,
    })
  end,
}
