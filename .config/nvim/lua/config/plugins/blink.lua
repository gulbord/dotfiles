return {
  {
    "saghen/blink.compat",
    version = "*",
    lazy = true,
    opts = {},
  },
  {
    "saghen/blink.cmp",
    version = "*",
    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      keymap = {
        preset = "default",
        ["<C-l>"] = { "accept" },
      },
      appearance = {
        nerd_font_variant = "mono",
      },
      completion = {
        accept = { auto_brackets = { enabled = true } },
        list = { selection = { preselect = true, auto_insert = true } },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 300,
          treesitter_highlighting = true,
          window = { border = "none" },
        },
        menu = { border = "none" },
      },
      snippets = { preset = "luasnip" },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
        providers = {
          conjure = {
            name = "conjure",
            module = "blink.compat.source",
          },
        },
      },
      signature = {
        enabled = true,
        window = { border = "none" },
      },
    },
    opts_extend = { "sources.default" },
  },
}
