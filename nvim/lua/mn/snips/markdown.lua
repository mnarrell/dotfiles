local ok, ls = pcall(require, "luasnip")
if not ok then
  vim.notify("Unable to load luasnip", vim.log.levels.ERROR)
  return
end

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

local yes, private = pcall(require, "mn.snips.markdown_private")
if yes then
  for _, v in ipairs(private) do
    table.insert(markdown, v)
  end
end

return markdown
