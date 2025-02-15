local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local t = ls.text_node
local fmta = require("luasnip.extras.fmt").fmta
local utils = require("config.plugins.luasnip.utils")

ls.add_snippets("tex", {
  s(
    {
      trig = "([^%a])l%(",
      desc = "Left/right parentheses",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      condition = utils.in_mathzone,
    },
    fmta(
      "<>\\left(<>\\right)",
      { f(utils.capture_one), d(1, utils.get_visual) }
    )
  ),
  s(
    {
      trig = "([^%a])l%[",
      desc = "Left/right square brackets",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      condition = utils.in_mathzone,
    },
    fmta(
      "<>\\left[<>\\right]",
      { f(utils.capture_one), d(1, utils.get_visual) }
    )
  ),
  s(
    {
      trig = "([^%a])l%{",
      desc = "Left/right curly brackets",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      condition = utils.in_mathzone,
    },
    fmta(
      "<>\\left\\{<>\\right\\}",
      { f(utils.capture_one), d(1, utils.get_visual) }
    )
  ),
  s({
    trig = "([%w%)%]%}])'",
    desc = "Superscript",
    regTrig = true,
    wordTrig = false,
    snippetType = "autosnippet",
    condition = utils.in_mathzone,
  }, fmta([[<>^{<>}]], { f(utils.capture_one), d(1, utils.get_visual) })),
  s({
    trig = "([%w%)%]%}]);",
    desc = "Subscript",
    regTrig = true,
    wordTrig = false,
    snippetType = "autosnippet",
    condition = utils.in_mathzone,
  }, fmta([[<>_{<>}]], { f(utils.capture_one), d(1, utils.get_visual) })),
  s({
    trig = "([%w%)%]%}])__",
    desc = "Sub- and superscript",
    regTrig = true,
    wordTrig = false,
    snippetType = "autosnippet",
    conditon = utils.in_mathzone,
  }, fmta([[<>_{<>}^{<>}]], { f(utils.capture_one), i(1), i(2) })),
  s(
    {
      trig = "([%w%)%]%}])sd",
      desc = "\\mathrm subscript",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      condition = utils.in_mathzone,
    },
    fmta([[<>_{\mathrm{<>}}]], { f(utils.capture_one), d(1, utils.get_visual) })
  ),
  s({
    trig = '([%w%)%]%}])"([%w])',
    desc = "Superscript shortcut",
    regTrig = true,
    wordTrig = false,
    snippetType = "autosnippet",
    condition = utils.in_mathzone,
  }, fmta([[<>^{<>}]], { f(utils.capture_one), f(utils.capture_two) })),
  s({
    trig = "([%w%)%]%}]):([%w])",
    desc = "Subscript shortcut",
    regTrig = true,
    wordTrig = false,
    snippetType = "autosnippet",
    condition = utils.in_mathzone,
  }, fmta([[<>_{<>}]], { f(utils.capture_one), f(utils.capture_two) })),
  s({
    trig = "([^%a])ee",
    desc = "e with superscript",
    regTrig = true,
    wordTrig = false,
    snippetType = "autosnippet",
    condition = utils.in_mathzone,
  }, fmta([[<>e^{<>}]], { f(utils.capture_one), d(1, utils.get_visual) })),
  s({
    trig = "([%a%)%]%}])00",
    desc = "0 subscript",
    regTrig = true,
    wordTrig = false,
    snippetType = "autosnippet",
    condition = utils.in_mathzone,
  }, fmta([[<>_{0}]], f(utils.capture_one))),
  s({
    trig = "([%a%)%]%}])11",
    desc = "-1 superscript",
    regTrig = true,
    wordTrig = false,
    snippetType = "autosnippet",
    condition = utils.in_mathzone,
  }, fmta([[<>^{-1}]], f(utils.capture_one))),
  s({
    trig = "([^%a])vv",
    desc = "Vector",
    regTrig = true,
    wordTrig = false,
    snippetType = "autosnippet",
    condition = utils.in_mathzone,
  }, fmta([[<>\vec{<>}]], { f(utils.capture_one), d(1, utils.get_visual) })),
  s({
    trig = "([^%a])uv",
    desc = "Unit vector",
    regTrig = true,
    wordTrig = false,
    snippetType = "autosnippet",
    condition = utils.in_mathzone,
  }, fmta([[<>\uvec{<>}]], { f(utils.capture_one), d(1, utils.get_visual) })),
  s(
    {
      trig = "([^%a])ff",
      desc = "Fraction",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet",
      condition = utils.in_mathzone,
    },
    fmta(
      [[<>\frac{<>}{<>}]],
      { f(utils.capture_one), d(1, utils.get_visual), i(2) }
    )
  ),
  s({
    trig = "([^%a])aa",
    desc = "Absolute value",
    regTrig = true,
    wordTrig = false,
    snippetType = "autosnippet",
    condition = utils.in_mathzone,
  }, fmta([[<>\abs{<>}]], { f(utils.capture_one), d(1, utils.get_visual) })),
  s({
    trig = "([^%a])sq",
    desc = "Square root",
    regTrig = true,
    wordTrig = false,
    snippetType = "autosnippet",
    condition = utils.in_mathzone,
  }, fmta([[<>\sqrt{<>}]], { f(utils.capture_one), d(1, utils.get_visual) })),
  s({
    trig = "([^%a])xv",
    desc = "Expected value",
    regTrig = true,
    wordTrig = false,
    snippetType = "autosnippet",
    condition = utils.in_mathzone,
  }, fmta([[<>\expval{<>}]], { f(utils.capture_one), d(1, utils.get_visual) })),
  s(
    { trig = "bar", desc = "Bar", condition = utils.in_mathzone },
    fmta([[\bar{<>}]], d(1, utils.get_visual))
  ),
  s(
    { trig = "hat", desc = "Hat", condition = utils.in_mathzone },
    fmta([[\hat{<>}]], d(1, utils.get_visual))
  ),
  s({
    trig = "([^%a])dvv",
    desc = "Derivative",
    regTrig = true,
    wordTrig = false,
    snippetType = "autosnippet",
    condition = utils.in_mathzone,
  }, fmta([[<>\diff{<>}{<>}]], { f(utils.capture_one), i(1), i(2) })),
  s({
    trig = "([^%a])ddv",
    desc = "Derivative (higher-order)",
    regTrig = true,
    wordTrig = false,
    snippetType = "autosnippet",
    condition = utils.in_mathzone,
  }, fmta([[<>\diff[<>]{<>}{<>}]], { f(utils.capture_one), i(1), i(2), i(3) })),
  s({
    trig = "([^%a])pvv",
    desc = "Partial derivative",
    regTrig = true,
    wordTrig = false,
    snippetType = "autosnippet",
    condition = utils.in_mathzone,
  }, fmta([[<>\pdiff{<>}{<>}]], { f(utils.capture_one), i(1), i(2) })),
  s({
    trig = "([^%a])ppv",
    desc = "Partial derivative (higher-order)",
    regTrig = true,
    wordTrig = false,
    snippetType = "autosnippet",
    condition = utils.in_mathzone,
  }, fmta(
    [[<>\pdiff[<>]{<>}{<>}]],
    { f(utils.capture_one), i(1), i(2), i(3) }
  )),
  s({
    trig = "([^%a])sM",
    desc = "Sum with lower limit",
    regTrig = true,
    wordTrig = false,
    snippetType = "autosnippet",
    condition = utils.in_mathzone,
  }, fmta([[<>\sum_{<>}]], { f(utils.capture_one), i(1) })),
  s({
    trig = "([^%a])smm",
    desc = "Sum with upper and lower limit",
    regTrig = true,
    wordTrig = false,
    snippetType = "autosnippet",
    condition = utils.in_mathzone,
  }, fmta([[<>\sum_{<>}^{<>}]], { f(utils.capture_one), i(1), i(2) })),
  s({
    trig = "([^%a])intt",
    desc = "Integral with upper and lower limit",
    regTrig = true,
    wordTrig = false,
    snippetType = "autosnippet",
    condition = utils.in_mathzone,
  }, fmta([[<>\int_{<>}^{<>}]], { f(utils.capture_one), i(1), i(2) })),
  s({
    trig = "([^%a])intf",
    desc = "Integral from negative to positive infinity",
    regTrig = true,
    wordTrig = false,
    snippetType = "autosnippet",
    condition = utils.in_mathzone,
  }, fmta([[<>\int_{-\infty}^{+\infty}]], f(utils.capture_one))),
  s({
    trig = "cdd",
    desc = "Centre dots",
    snippetType = "autosnippet",
    condition = utils.in_mathzone,
  }, t("\\cdots")),
  s({
    trig = "ldd",
    desc = "Lower dots",
    snippetType = "autosnippet",
    condition = utils.in_mathzone,
  }, t("\\ldots")),
  s({
    trig = "px",
    desc = "Approx",
    snippetType = "autosnippet",
    condition = utils.in_mathzone,
  }, t("\\approx ")),
  s({
    trig = ">>",
    desc = "Implies",
    snippetType = "autosnippet",
    condition = utils.in_mathzone,
  }, t("\\implies ")),
  s({
    trig = "~~",
    desc = "Sim",
    snippetType = "autosnippet",
    condition = utils.in_mathzone,
  }, t("\\sim ")),
  s({
    trig = "ooo",
    desc = "Infinity",
    snippetType = "autosnippet",
    condition = utils.in_mathzone,
  }, t("\\infty")),
  s({
    trig = "xx",
    desc = "Times",
    snippetType = "autosnippet",
    condition = utils.in_mathzone,
  }, t("\\times")),
  s({
    trig = "gvn",
    desc = "Given",
    snippetType = "autosnippet",
    condition = utils.in_mathzone,
  }, t("\\given")),
})
