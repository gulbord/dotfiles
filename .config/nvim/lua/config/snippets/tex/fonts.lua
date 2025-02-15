local ls = require("luasnip")
local s = ls.snippet
local d = ls.dynamic_node
local f = ls.function_node
local fmta = require("luasnip.extras.fmt").fmta
local utils = require("config.plugins.luasnip.utils")

ls.add_snippets("tex", {
  s(
    { trig = "tee", desc = "Text" },
    fmta([[\text{<>}]], d(1, utils.get_visual))
  ),
  s(
    { trig = "em", desc = "Emphasis" },
    fmta([[\emph{<>}]], d(1, utils.get_visual))
  ),
  s(
    { trig = "it", desc = "Italic" },
    fmta([[\textit{<>}]], d(1, utils.get_visual))
  ),
  s(
    { trig = "bf", desc = "Bold" },
    fmta([[\textbf{<>}]], d(1, utils.get_visual))
  ),
  s(
    { trig = "tt", desc = "Typewriter" },
    fmta([[\texttt{<>}]], d(1, utils.get_visual))
  ),
  s(
    { trig = "ab", desc = "Abrreviation" },
    fmta([[\abbr{<>}]], d(1, utils.get_visual))
  ),
  s({
    trig = "([^%a])mrm",
    desc = "Math roman",
    regTrig = true,
    wordTrig = false,
    snippetType = "autosnippet",
    condition = utils.in_mathzone,
  }, fmta([[<>\mathrm{<>}]], { f(utils.capture_one), d(1, utils.get_visual) })),
  s({
    trig = "([^%a])mcal",
    desc = "Math calligraphic",
    regTrig = true,
    wordTrig = false,
    snippetType = "autosnippet",
    condition = utils.in_mathzone,
  }, fmta(
    [[<>\mathcal{<>}]],
    { f(utils.capture_one), d(1, utils.get_visual) }
  )),
  s({
    trig = "mbb",
    desc = "Math blackboard",
    regTrig = true,
    wordTrig = false,
    snippetType = "autosnippet",
    condition = utils.in_mathzone,
  }, fmta([[<>\mathbb{<>}]], { f(utils.capture_one), d(1, utils.get_visual) })),
})
