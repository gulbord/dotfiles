local M = {}

local ls = require("luasnip")
local i = ls.insert_node
local sn = ls.snippet_node

function M.capture_one(_, snip)
  return snip.captures[1]
end

function M.capture_two(_, snip)
  return snip.captures[2]
end

function M.get_visual(_, parent)
  if #parent.snippet.env.LS_SELECT_RAW > 0 then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else
    return sn(nil, i(1, ""))
  end
end

function M.in_mathzone()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

return M
