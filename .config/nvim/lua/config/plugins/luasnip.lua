return {
  "L3MON4D3/LuaSnip",
  version = "2.*",
  config = function()
    require("luasnip").setup({
      enable_autosnippets = true,
      update_events = "TextChanged,TextChangedI",
    })

    require("luasnip.loaders.from_lua").lazy_load({
      paths = { "~/.config/nvim/lua/config/snippets" },
    })
  end,
}
