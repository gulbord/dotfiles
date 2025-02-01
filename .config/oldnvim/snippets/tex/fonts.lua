local tsutils = require("gulbo.tsutils")

return {
  -- 
  s(
    { trig = "tee" },
    fmta([[\text{<>}]], d(1, get_visual))
  ),
  -- EMPHASIS
  s(
    { trig = "em" },
    fmta([[\emph{<>}]], d(1, get_visual))
  ),
  -- ITALIC
  s(
    { trig = "it" },
    fmta([[\textit{<>}]], d(1, get_visual))
  ),
  -- BOLD
  s(
    { trig = "bf" },
    fmta([[\textbf{<>}]], d(1, get_visual))
  ),
  -- TYPEWRITER
  s(
    { trig = "tt" },
    fmta([[\texttt{<>}]], d(1, get_visual))
  ),
  -- ABBREVIATION
  s(
    { trig = "ab" },
    fmta([[\abbr{<>}]], d(1, get_visual))
  ),
  -- MATH ROMAN
  s(
    {
      trig = "([^%a])mrm",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta([[<>\mathrm{<>}]], { f(capture_one), d(1, get_visual) }),
    { condition = tsutils.in_mathzone }
  ),
  -- MATH CALLIGRAPHIC
  s(
    {
      trig = "([^%a])mcal",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta([[<>\mathcal{<>}]], { f(capture_one), d(1, get_visual) }),
    { condition = tsutils.in_mathzone }
  ),
  -- MATH BLACKBOARD
  s(
    {
      trig = "mbb",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta([[<>\mathbb{<>}]], { f(capture_one), d(1, get_visual) }),
    { condition = tsutils.in_mathzone }
  )
}
