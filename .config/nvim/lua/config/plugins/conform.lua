return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format({ async = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  ---@module "conform"
  ---@type conform.setupOpts
  opts = {
    formatters_by_ft = {
      c = { "clang-format" },
      cpp = { "clang-format" },
      haskell = { "fourmolu" },
      lua = { "stylua" },
      ocaml = { "ocamlformat" },
      python = { "ruff" },
      rust = { "rustfmt" },
    },
    default_format_opts = { lsp_format = "fallback" },
    format_on_save = { timeout_ms = 500 },
    formatters = {
      ruff = { prepend_args = { "--config", "line-length=80" } },
    },
  },
}
