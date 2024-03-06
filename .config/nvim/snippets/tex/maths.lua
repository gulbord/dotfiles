local tsutils = require("gulbo.tsutils")

return {
  -- LEFT/RIGHT PARENTHESES
  s(
    {
      trig = "([^%a])l%(",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta("<>\\left(<>\\right)", { f(capture_one), d(1, get_visual) }),
    { condition = tsutils.in_mathzone }
  ),
  -- LEFT/RIGHT SQUARE BRACES
  s(
    {
      trig = "([^%a])l%[",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta("<>\\left[<>\\right]", { f(capture_one), d(1, get_visual) }),
    { condition = tsutils.in_mathzone }
  ),
  -- LEFT/RIGHT CURLY BRACES
  s(
    {
      trig = "([^%a])l%{",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta("<>\\left\\{<>\\right\\}", { f(capture_one), d(1, get_visual) }),
    { condition = tsutils.in_mathzone }
  ),
  -- SUPERSCRIPT
  s(
    {
      trig = "([%w%)%]%}])'",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta([[<>^{<>}]], { f(capture_one), d(1, get_visual) }),
    { condition = tsutils.in_mathzone }
  ),
  -- SUBSCRIPT
  s(
    {
      trig = "([%w%)%]%}]);",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta([[<>_{<>}]], { f(capture_one), d(1, get_visual) }),
    { condition = tsutils.in_mathzone }
  ),
  -- SUB- AND SUPERSCRIPT
  s(
    {
      trig = "([%w%)%]%}])__",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta([[<>^{<>}_{<>}]], { f(capture_one), i(1), i(2) }),
    { condition = tsutils.in_mathzone }
  ),
  --  SUBSCRIPT
  s(
    { trig = "sd", snippetType = "autosnippet" },
    fmta([[_{\mathrm{<>}}]], d(1, get_visual)),
    { condition = tsutils.in_mathzone }
  ),
  -- SUPERSCRIPT SHORTCUT
  -- places the first alphanumeric character after the trigger into a
  -- superscript
  s(
    {
      trig = '([%w%)%]%}])"([%w])',
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta([[<>^{<>}]], { f(capture_one), f(capture_two) }),
    { condition = tsutils.in_mathzone }
  ),
  -- SUBSCRIPT SHORTCUT
  -- places the first alphanumeric character after the trigger into a
  -- subscript
  --s(
  --  {
  --    trig = '([%w%)%]%}]):([%w])',
  --    regTrig = true,
  --    wordTrig = false,
  --    snippetType = "autosnippet"
  --  },
  --  fmta([[<>_{<>}]], { f(capture_one), f(capture_two) }),
  --  { condition = tsutils.in_mathzone }
  --),
  -- EULER'S NUMBER SUPERSCRIPT
  s(
    {
      trig = "([^%a])ee",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta([[<>e^{<>}]], { f(capture_one), d(1, get_visual) }),
    { condition = tsutils.in_mathzone }
  ),
  -- ZERO SUBSCRIPT 
  s(
    {
      trig = "([%a%)%]%}])00",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta([[<>_{<>}]], { f(capture_one), t("0") }),
    { condition = tsutils.in_mathzone }
  ),
  -- MINUS ONE SUPERSCRIPT
  s(
    {
      trig = "([%a%)%]%}])11",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta([[<>^{<>}]], { f(capture_one), t("-1") }),
    { condition = tsutils.in_mathzone }
  ),
  -- VECTOR
  s(
    {
      trig = "([^%a])vv",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta([[<>\vec{<>}]], { f(capture_one), d(1, get_visual) }),
    { condition = tsutils.in_mathzone }
  ),
  -- UNIT VECTOR
  s(
    {
      trig = "([^%a])uv",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta([[<>\uvec{<>}]], { f(capture_one), d(1, get_visual) }),
    { condition = tsutils.in_mathzone }
  ),
  -- FRACTION
  s(
    {
      trig = "([^%a])ff",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta([[<>\frac{<>}{<>}]], { f(capture_one), d(1, get_visual), i(2) }),
    { condition = tsutils.in_mathzone }
  ),
  -- ABSOLUTE VALUE
  s(
    {
      trig = "([^%a])aa",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta([[<>\abs{<>}]], { f(capture_one), d(1, get_visual) }),
    { condition = tsutils.in_mathzone }
  ),
  -- SQUARE ROOT
  s(
    {
      trig = "([^%a])sq",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta([[<>\sqrt{<>}]], { f(capture_one), d(1, get_visual) }),
    { condition = tsutils.in_mathzone }
  ),
  -- DERIVATIVE
  s(
    {
      trig = "([^%a])dvv",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta([[<>\diff{<>}{<>}]], { f(capture_one), i(1), i(2) }),
    { condition = tsutils.in_mathzone }
  ),
  -- DERIVATIVE (higher-order)
  s(
    {
      trig = "([^%a])ddv",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta([[<>\diff[<>]{<>}{<>}]], { f(capture_one), i(1), i(2), i(3) }),
    { condition = tsutils.in_mathzone }
  ),
  -- PARTIAL DERIVATIVE
  s(
    {
      trig = "([^%a])pvv",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta([[<>\pdiff{<>}{<>}]], { f(capture_one), i(1), i(2) }),
    { condition = tsutils.in_mathzone }
  ),
  -- PARTIAL DERIVATIVE (higher-order)
  s(
    {
      trig = "([^%a])ppv",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta([[<>\pdiff[<>]{<>}{<>}]], { f(capture_one), i(1), i(2), i(3) }),
    { condition = tsutils.in_mathzone }
  ),
  -- SUM with lower limit
  s(
    {
      trig = "([^%a])sM",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta([[<>\sum_{<>}]], { f(capture_one), i(1) }),
    { condition = tsutils.in_mathzone }
  ),
  -- SUM with upper and lower limit
  s(
    {
      trig = "([^%a])smm",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta([[<>\sum_{<>}^{<>}]], { f(capture_one), i(1), i(2) }),
    { condition = tsutils.in_mathzone }
  ),
  -- INTEGRAL with upper and lower limit
  s(
    {
      trig = "([^%a])intt",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta([[<>\int_{<>}^{<>}]], { f(capture_one), i(1), i(2) }),
    { condition = tsutils.in_mathzone }
  ),
  -- INTEGRAL from negative to positive infinity
  s(
    {
      trig = "([^%a])intt",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta([[<>\int_{-\infty}^{+\infty}]], f(capture_one)),
    { condition = tsutils.in_mathzone }
  ),
  -- CDOTS
  s(
    { trig = "cdd", snippetType = "autosnippet" },
    t("\\cdots"),
    { condition = tsutils.in_mathzone }
  ),
  -- LDOTS
  s(
    { trig = "ldd", snippetType = "autosnippet" },
    t("\\ldots"),
    { condition = tsutils.in_mathzone }
  ),
  -- APPROX
  s(
    { trig = "px", snippetType = "autosnippet" },
    t("\\approx "),
    { condition = tsutils.in_mathzone }
  ),
  -- IMPLIES
  s(
    { trig = ">>", snippetType = "autosnippet" },
    t("\\implies "),
    { condition = tsutils.in_mathzone }
  ),
  -- SIM
  s(
    { trig = "~~", snippetType = "autosnippet" },
    t("\\sim "),
    { condition = tsutils.in_mathzone }
  ),
  -- INFINITY
  s(
    { trig = "ooo", snippetType = "autosnippet" },
    t("\\infty"),
    { condition = tsutils.in_mathzone }
  ),
  -- TIMES
  s(
    { trig = "xx", snippetType = "autosnippet" },
    t("\\times"),
    { condition = tsutils.in_mathzone }
  )
}
