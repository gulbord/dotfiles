local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local d = ls.dynamic_node
local f = ls.function_node
local t = ls.text_node
local fmta = require("luasnip.extras.fmt").fmta
local conds = require("luasnip.extras.expand_conditions")
local utils = require("config.plugins.luasnip.utils")

ls.add_snippets("tex", {
  s(
    { trig = "up", desc = "Use package" },
    fmta([[\usepackage{<>}]], d(1, utils.get_visual))
  ),
  s({ trig = "url", desc = "URL" }, fmta([[\url{<>}]], d(1, utils.get_visual))),
  s(
    { trig = "fn", desc = "Footnote" },
    fmta([[\footnote{<>}]], d(1, utils.get_visual))
  ),
  s({
    trig = "LU",
    desc = "Link with URL in visual selection",
    snippetType = "autosnippet",
  }, fmta([[\href{<>}{<>}]], { d(1, utils.get_visual), i(2) })),
  s({
    trig = "LL",
    desc = "Link with text in visual selection",
    snippetType = "autosnippet",
  }, fmta([[\href{<>}{<>}]], { i(1), d(2, utils.get_visual) })),
  s({
    trig = "(.)rr",
    desc = "Reference with cleveref",
    regTrig = true,
    wordTrig = false,
  }, fmta([[<>\cref{<>}]], { f(utils.capture_one), d(1, utils.get_visual) })),
  s(
    { trig = "lbl", desc = "Label", snippetType = "autosnippet" },
    fmta([[\label{<>}]], d(1, utils.get_visual)),
    { condition = conds.line_begin }
  ),
  s(
    { trig = "cpt", desc = "Caption", snippetType = "autosnippet" },
    fmta([[\caption{<>}]], d(1, utils.get_visual)),
    { condition = conds.line_begin }
  ),
  s(
    { trig = "nc", desc = "New command" },
    fmta([[\newcommand{<>}{<>}]], { i(1), i(2) })
  ),
  s(
    { trig = "num", desc = "Number with siunitx" },
    fmta([[\num{<>}]], d(1, utils.get_visual))
  ),
  s({
    trig = "([^%a])qtt",
    desc = "Quantity with siunitx",
    regTrig = true,
    wordTrig = false,
    snippetType = "autosnippet",
  }, fmta([[<>\qty{<>}{<>}]], { f(utils.capture_one), i(1), i(2) })),
  s({
    trig = "ii",
    desc = "Item",
    snippetType = "autosnippet",
    condition = conds.line_begin,
  }, t("\\item ")),
  s({ trig = "q", desc = "Quad space" }, t("\\quad ")),
  s(
    { trig = "''", desc = "Enquote with csquotes", snippetType = "autosnippet" },
    fmta([[\enquote{<>}]], d(1, utils.get_visual))
  ),
  s(
    { trig = "cit", desc = "Autocitation" },
    fmta([[\autocite{<>}]], d(1, utils.get_visual))
  ),
  s(
    { trig = "tcit", desc = "Text autocitation" },
    fmta([[\textcite{<>}]], d(1, utils.get_visual))
  ),
})
