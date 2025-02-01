return {
  -- PACKAGE
  s(
    { trig = "up" },
    fmta([[\usepackage{<>}]], d(1, get_visual))
  ),
  -- URL
  s(
    { trig = "url" },
    fmta([[\url{<>}]], d(1, get_visual))
  ),
  -- FOOTNOTE
  s(
    { trig = "fn" },
    fmta([[\footnote{<>}]], d(1, get_visual))
  ),
  -- LINK with url in visual selection
  s(
    { trig = "LU", snippetType = "autosnippet" },
    fmta([[\href{<>}{<>}]], { d(1, get_visual), i(2) })
  ),
  -- LINK with text in visual selection
  s(
    { trig = "LL", snippetType = "autosnippet" },
    fmta([[\href{<>}{<>}]], { i(1), d(2, get_visual) })
  ),
  -- REFERENCE
  s(
    { trig = "(.)rr", regTrig = true, wordTrig = false },
    fmta([[<>\cref{<>}]], { f(capture_one), d(1, get_visual) })
  ),
  -- LABEL
  s(
    { trig = "lbl", snippetType = "autosnippet" },
    fmta([[\label{<>}]], d(1, get_visual)),
    { condition = conds.line_begin }
  ),
  -- CAPTION
  s(
    { trig = "cpt", snippetType = "autosnippet" },
    fmta([[\caption{<>}]], d(1, get_visual)),
    { condition = conds.line_begin }
  ),
  -- NEW COMMAND
  s(
    { trig = "nc" },
    fmta([[\newcommand{<>}{<>}]], { i(1), i(2) })
  ),
  -- NUMBER (siunitx)
  s(
    { trig = "num" },
    fmta([[\num{<>}]], { d(1, get_visual) })
  ),
  -- QUANTITY (siunitx)
  s(
    {
      trig = "([^%a])qtt",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta([[<>\qty{<>}{<>}]], { f(capture_one), i(1), i(2) })
  ),
  -- ITEM
  s(
    { trig = "ii", snippetType = "autosnippet" },
    t("\\item "),
    { condition = conds.line_begin }
  ),
  -- QUAD
  s(
    { trig = "q" },
    t("\\quad ")
  ),
  -- ENQUOTE
  s(
    { trig = "''", snippetType = "autosnippet" },
    fmta([[\enquote{<>}]], d(1, get_visual))
  ),
  -- CITE
  s(
    { trig = "cit" },
    fmta([[\autocite{<>}]], d(1, get_visual))
  ),
  -- TEXT CITE
  s(
    { trig = "tcit" },
    fmta([[\textcite{<>}]], d(1, get_visual))
  )
}
