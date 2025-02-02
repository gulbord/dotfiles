return {
  "saghen/blink.cmp",
  dependencies = "rafamadriz/friendly-snippets",
  version = "*",
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = "default" },
    appearance = {
      nerd_font_variant = "mono",
    },
    completion = {
      accept = { auto_brackets = { enabled = true } },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 300,
        treesitter_highlighting = true,
        window = { border = "none" },
      },
      menu = { border = "none" },
    },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      cmdline = function()
        local type = vim.fn.getcmdtype()
        if type == "/" or type == "?" then
          return { "buffer" }
        end
        return {}
      end,
    },
    signature = {
      enabled = true,
      window = { border = "none" },
    },
  },
  opts_extend = { "sources.default" },
}
