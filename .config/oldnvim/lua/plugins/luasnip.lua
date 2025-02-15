return {
  "L3MON4D3/LuaSnip",
  version = "*",
  config = function()
    local ls = require("luasnip")
    local s = ls.snippet
    local sn = ls.snippet_node
    local t = ls.text_node
    local i = ls.insert_node
    local c = ls.choice_node
    local f = ls.function_node
    local d = ls.dynamic_node
    local fmt = require("luasnip.extras.fmt").fmt
    local fmta = require("luasnip.extras.fmt").fmta
    local rep = require("luasnip.extras").rep
    local conds = require("luasnip.extras.expand_conditions")

    vim.cmd([[
    " use tab to expand and jump through snippets
    imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ?
      \ '<Plug>luasnip-expand-or-jump' : '<Tab>' 
    smap <silent><expr> <Tab> luasnip#jumpable(1) ?
      \ '<Plug>luasnip-jump-next' : '<Tab>'

    " use shift-tab to jump backwards through snippets
    imap <silent><expr> <S-Tab> luasnip#jumpable(-1) ?
      \ '<Plug>luasnip-jump-prev' : '<S-Tab>'
    smap <silent><expr> <S-Tab> luasnip#jumpable(-1) ?
      \ '<Plug>luasnip-jump-prev' : '<S-Tab>'

    " cycle forward through choice nodes with control-f
    imap <silent><expr> <C-f> luasnip#choice_active() ?
      \ '<Plug>luasnip-next-choice' : '<C-f>'
    smap <silent><expr> <C-f> luasnip#choice_active() ?
      \ '<Plug>luasnip-next-choice' : '<C-f>'
    ]])

    ls.setup({
      -- enable autotriggered snippets
      enable_autosnippets = true,
      -- use tab to trigger visual selection
      store_selection_keys = "<Tab>",
      -- for text in repeated nodes to update as you type
      update_events = "TextChanged,TextChangedI",
    })

    function get_visual(args, parent)
      if #parent.snippet.env.LS_SELECT_RAW > 0 then
        return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
      else
        return sn(nil, i(1, ""))
      end
    end

    function capture_one(_, snip)
      return snip.captures[1]
    end

    function capture_two(_, snip)
      return snip.captures[2]
    end

    require("luasnip.loaders.from_lua").lazy_load({
      path = "~/.config/oldnvim/snippets",
    })
  end,
}
