local ls = require("luasnip")
local s = ls.s
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local markdown = {
  s(
    { trig = "refl", name = "Reference link" },
    fmt(
      [[
        [{}][{}]{}

        [{}]: {} "{}"
      ]],
      { i(1, "Text"), i(2, "id"), i(0), rep(2), i(3, "http://www.url.com"), rep(3) }
    )
  ),

  s({ trig = "link", name = "Link" }, fmt("[{}]({})", { i(1, "Text"), i(2, "http://www.url.com") })),
}

return markdown
