return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        {
          -- Load luvit types when the `vim.uv` word is found
          path = "${3rd}/luv/library",
          words = { "vim%.uv" },
        },
      },
    },
  },
  config = function()
    local lspconfig = require("lspconfig")
    lspconfig.lua_ls.setup({})
  end,
}
