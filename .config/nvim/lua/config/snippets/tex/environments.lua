local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local d = ls.dynamic_node
local f = ls.function_node
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep
local conds = require("luasnip.extras.expand_conditions")
local utils = require("config.plugins.luasnip.utils")

ls.add_snippets("tex", {
  s(
    { trig = "beg", desc = "Generic environment" },
    fmta(
      [[
      \begin{<>}
        <>
      \end{<>}
      ]],
      { i(1), d(2, utils.get_visual), rep(1) }
    )
  ),
  s(
    { trig = "beg2", desc = "Generic environment with two arguments" },
    fmta(
      [[
      \begin{<>}{<>}
        <>
      \end{<>}
      ]],
      { i(1), i(2), d(3, utils.get_visual), rep(1) }
    )
  ),
  s(
    { trig = "enum", desc = "Enumerate" },
    fmta(
      [[
      \begin{enumerate}
        \item <>
      \end{enumerate}
      ]],
      d(1, utils.get_visual)
    )
  ),
  s(
    { trig = "item", desc = "Itemize" },
    fmta(
      [[
      \begin{itemize}
        \item <>
      \end{itemize}
      ]],
      d(1, utils.get_visual)
    )
  ),
  s({
    trig = "([^%a])mk",
    desc = "Inline math",
    regTrig = true,
    wordTrig = false,
    snippetType = "autosnippet",
  }, fmta([[<>$<>$]], { f(utils.capture_one), d(1, utils.get_visual) })),
  s({
    trig = "^mk",
    desc = "Inline math on new line",
    regTrig = true,
    wordTrig = false,
    snippetType = "autosnippet",
  }, fmta([[$<>$]], i(1))),
  s(
    { trig = "dm", desc = "Display math without numbering" },
    fmta(
      [[
      \[
        <>
      \]
      ]],
      d(1, utils.get_visual)
    )
  ),
  s(
    { trig = "equ", desc = "Equation" },
    fmta(
      [[
      \begin{equation}
        <>
      \end{equation}
      ]],
      d(1, utils.get_visual)
    )
  ),
  s(
    {
      trig = "spl",
      desc = "Split equation",
      snippetType = "autosnippet",
      condition = conds.line_begin,
    },
    fmta(
      [[
      \begin{split}
        <>
      \end{split}
      ]],
      d(1, utils.get_visual)
    )
  ),
  s(
    { trig = "fig", desc = "Figure" },
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
  ),
})
