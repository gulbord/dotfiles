return {
  "L3MON4D3/LuaSnip",
  version = "2.*",
  config = function()
    local ls = require("luasnip")

    ls.setup({
      enable_autosnippets = true,
      update_events = "TextChanged,TextChangedI",
    })

    vim.keymap.set("i", "<C-j>", function()
      ls.expand()
    end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<Tab>", function()
      if ls.locally_jumpable(1) then
        ls.jump(1)
      else
        vim.api.nvim_feedkeys(
          vim.api.nvim_replace_termcodes("<Tab>", true, false, true),
          "n",
          false
        )
      end
    end, { silent = true })
    vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
      ls.jump(-1)
    end, { silent = true })

    vim.keymap.set({ "i", "s" }, "<C-e>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end, { silent = true })

    vim.api.nvim_create_user_command("LuaSnipEdit", function()
      require("luasnip.loaders").edit_snippet_files()
    end, { desc = "Edit LuaSnip snippets" })

    require("luasnip.loaders.from_lua").lazy_load({
      paths = { "~/.config/nvim/lua/config/snippets" },
    })
  end,
}
