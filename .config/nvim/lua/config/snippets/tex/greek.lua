local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("tex", {
  s({ trig = ";a", desc = "alpha", snippetType = "autosnippet" }, t("\\alpha")),
  s({ trig = ";b", desc = "beta", snippetType = "autosnippet" }, t("\\beta")),
  s({ trig = ";g", desc = "gamma", snippetType = "autosnippet" }, t("\\gamma")),
  s({ trig = ";G", desc = "Gamma", snippetType = "autosnippet" }, t("\\Gamma")),
  s({ trig = ";d", desc = "delta", snippetType = "autosnippet" }, t("\\delta")),
  s({ trig = ";D", desc = "Delta", snippetType = "autosnippet" }, t("\\Delta")),
  s(
    { trig = ";e", desc = "epsilon", snippetType = "autosnippet" },
    t("\\epsilon")
  ),
  s({ trig = ";z", desc = "zeta", snippetType = "autosnippet" }, t("\\zeta")),
  s({ trig = ";h", desc = "eta", snippetType = "autosnippet" }, t("\\eta")),
  s({ trig = ";v", desc = "theta", snippetType = "autosnippet" }, t("\\theta")),
  s({ trig = ";V", desc = "Theta", snippetType = "autosnippet" }, t("\\Theta")),
  s({ trig = ";i", desc = "iota", snippetType = "autosnippet" }, t("\\iota")),
  s({ trig = ";k", desc = "kappa", snippetType = "autosnippet" }, t("\\kappa")),
  s(
    { trig = ";l", desc = "lambda", snippetType = "autosnippet" },
    t("\\lambda")
  ),
  s(
    { trig = ";L", desc = "Lambda", snippetType = "autosnippet" },
    t("\\Lambda")
  ),
  s({ trig = ";m", desc = "mu", snippetType = "autosnippet" }, t("\\mu")),
  s({ trig = ";n", desc = "nu", snippetType = "autosnippet" }, t("\\nu")),
  s({ trig = ";x", desc = "xi", snippetType = "autosnippet" }, t("\\xi")),
  s({ trig = ";X", desc = "Xi", snippetType = "autosnippet" }, t("\\Xi")),
  s(
    { trig = ";o", desc = "omicron", snippetType = "autosnippet" },
    t("\\omicron")
  ),
  s({ trig = ";p", desc = "pi", snippetType = "autosnippet" }, t("\\pi")),
  s({ trig = ";P", desc = "Pi", snippetType = "autosnippet" }, t("\\Pi")),
  s({ trig = ";r", desc = "rho", snippetType = "autosnippet" }, t("\\rho")),
  s({ trig = ";s", desc = "sigma", snippetType = "autosnippet" }, t("\\sigma")),
  s({ trig = ";S", desc = "Sigma", snippetType = "autosnippet" }, t("\\Sigma")),
  s({ trig = ";t", desc = "tau", snippetType = "autosnippet" }, t("\\tau")),
  s(
    { trig = ";y", desc = "upsilon", snippetType = "autosnippet" },
    t("\\upsilon")
  ),
  s(
    { trig = ";Y", desc = "Upsilon", snippetType = "autosnippet" },
    t("\\Upsilon")
  ),
  s({ trig = ";f", desc = "phi", snippetType = "autosnippet" }, t("\\phi")),
  s({ trig = ";F", desc = "Phi", snippetType = "autosnippet" }, t("\\Phi")),
  s({ trig = ";c", desc = "chi", snippetType = "autosnippet" }, t("\\chi")),
  s({ trig = ";u", desc = "psi", snippetType = "autosnippet" }, t("\\psi")),
  s({ trig = ";U", desc = "Psi", snippetType = "autosnippet" }, t("\\Psi")),
  s({ trig = ";w", desc = "omega", snippetType = "autosnippet" }, t("\\omega")),
  s({ trig = ";W", desc = "Omega", snippetType = "autosnippet" }, t("\\Omega")),
})
