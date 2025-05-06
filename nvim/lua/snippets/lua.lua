local ls = require("luasnip")

local s = ls.s
local i = ls.insert_node
local t = ls.text_node
local fmt = require("luasnip.extras.fmt").fmt

return {
  s({ trig = "local", name = "Local variable definition" }, { t("local "), i(1, "x"), t(" = "), i(0, "1") }),

  s(
    { trig = "lf", name = "Local function definition" },
    { t("local "), i(1), t(" = function("), i(2, "..."), t({ ")", "	" }), i(0, "-- body"), t({ "", "end" }) }
  ),

  s(
    { trig = "func", name = "Basic function definition" },
    { t("function "), i(1, "fname"), t("("), i(2, "..."), t({ ")", "	" }), i(0, "-- body"), t({ "", "end" }) }
  ),

  s(
    { trig = "for", name = "Basic for loop" },
    fmt(
      [[
        for {}={},{} do
          {}
        end
      ]],
      { i(1, "i"), i(2, "1"), i(3, "10"), i(0, "print(i)") }
    )
  ),

  s(
    { trig = "forp", name = "For pairs" },
    fmt(
      [[
        for {}, {} in pairs({}) do
          {}
        end
      ]],
      { i(1, "k"), i(2, "v"), i(3, "table_name"), i(0, "-- body") }
    )
  ),

  s(
    { trig = "fori", name = "For ipairs" },
    fmt(
      [[
        for {}, {} in ipairs({}) do
          {}
        end
      ]],
      { i(1, "k"), i(2, "v"), i(3, "table_name"), i(0, "-- body") }
    )
  ),

  s(
    { trig = "if", name = "Conditional" },
    { t("if "), i(1, "condition"), t(" then", "	"), i(2, "-- body"), t("", "end") }
  ),

  s({ trig = "ife", name = "if/else" }, {
    t("if "),
    i(1, "condition"),
    t({ " then", "	" }),
    i(2, "-- truth"),
    t({ "", "else", "	" }),
    i(0, "-- false"),
    t({ "", "end" }),
  }),
}
