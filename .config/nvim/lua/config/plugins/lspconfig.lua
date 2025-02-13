return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "saghen/blink.cmp",
    {
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
  },
  opts = {
    servers = {
      lua_ls = {
        settings = { lineLength = 80 },
      },
      ocamllsp = {
        cmd = { "ocamllsp" },
        filetypes = {
          "ocaml",
          "ocaml.menhir",
          "ocaml.interface",
          "ocaml.ocamllex",
          "reason",
          "dune",
        },
      },
      basedpyright = {},
      r_language_server = {},
    },
  },
  config = function(_, opts)
    -- Handle mason first
    require("mason").setup()
    require("mason-lspconfig").setup()

    local lspconfig = require("lspconfig")
    local blink_cmp = require("blink.cmp")
    for server, config in pairs(opts.servers) do
      config.capabilities = blink_cmp.get_lsp_capabilities(config.capabilities)
      lspconfig[server].setup(config)
    end
  end,
}
