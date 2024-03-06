return {
  -- GENERIC ENVIRONMENT
  s(
    { trig = "beg" },
    fmta(
      [[
      \begin{<>}
        <>
      \end{<>}
      ]],
      { i(1), d(2, get_visual), rep(1) }
    )
  ),
  -- GENERIC ENVIRONMENT with two arguments
  s(
    { trig = "beg2" },
    fmta(
      [[
      \begin{<>}{<>}
        <>
      \end{<>}
      ]],
      { i(1), i(2), d(3, get_visual), rep(1) }
    )
  ),
  -- ENUMERATE
  s(
    { trig = "enum" },
    fmta(
      [[
      \begin{enumerate}
        \item <>
      \end{enumerate}
      ]],
      d(1, get_visual)
    )
  ),
  -- ITEMIZE
  s(
    { trig = "item" },
    fmta(
      [[
      \begin{itemize}
        \item <>
      \end{itemize}
      ]],
      d(1, get_visual)
    )
  ),
  -- INLINE MATH
  s(
    {
      trig = "([^%a])mk",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta([[<>$<>$]], { f(capture_one), d(1, get_visual) })
  ),
  -- INLINE MATH on new line
  s(
    {
      trig = "^mk",
      regTrig = true,
      wordTrig = false,
      snippetType = "autosnippet"
    },
    fmta([[$<>$]], i(1))
  ),
  -- DISPLAY MATH no numbering
  s(
    { trig = "dm" },
    fmta(
      [[
      \[
        <>
      \]
      ]],
      d(1, get_visual)
    )
  ),
  -- EQUATION
  s(
    { trig = "equ" },
    fmta(
      [[
      \begin{equation}
        <>
      \end{equation}
      ]],
      d(1, get_visual)
    )
  ),
  -- SPLIT
  s(
    { trig = "spl", snippetType = "autosnippet" },
    fmta(
      [[
      \begin{split}
        <>
      \end{split}
      ]],
      d(1, get_visual)
    ),
    { condition = conds.line_begin }
  ),
  -- GENERIC FIGURE
  s(
    { trig = "fig" },
    fmta(
      [[
      \begin{figure}
        \centering
        \includegraphics[<>]{<>}
        \caption{<>}
        \label{<>}
      \end{figure}
      ]],
      { i(1), i(2), i(3), i(4) }
    )
  )
}
