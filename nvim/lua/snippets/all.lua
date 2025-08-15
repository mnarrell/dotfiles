local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node
local f = ls.function_node

local function generate_uuid()
  local handle = io.popen("uuidgen")
  if not handle then
    return "missing uuidgen"
  end
  local uuid = handle:read("*a")
  handle:close()
  return uuid:gsub("%s+", "") -- trim any whitespace
end

local all = {
  s({ trig = "date", name = "Date", dscr = "Date in the form of YYYY-MM-DD" }, t(os.date("%Y-%m-%d"))),

  s(
    { trig = "lorem", name = "Lorem ipsum" },
    t(
      "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    )
  ),

  s({ trig = "MIT", name = "MIT License" }, {
    i(1, "one line to give the program's name and a brief description"),
    t({ "", "", "Copyright (c) " }),
    t(os.date("%Y")),
    t({ ", Matt Narrell", "" }),
    t({
      [[]],
      [[Permission is hereby granted, free of charge, to any person obtaining]],
      [[a copy of this software and associated documentation files (the "Software"),]],
      [[to deal in the Software without restriction, including without limitation]],
      [[the rights to use, copy, modify, merge, publish, distribute, sublicense,]],
      [[and/or sell copies of the Software, and to permit persons to whom the]],
      [[Software is furnished to do so, subject to the following conditions:]],
      [[]],
      [[The above copyright notice and this permission notice shall be included]],
      [[in all copies or substantial portions of the Software.]],
      [[]],
      [[THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,]],
      [[EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES]],
      [[OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.]],
      [[IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM,]],
      [[DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,]],
      [[TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE]],
      [[OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.]],
    }),
  }),

  s({ trig = "uuid", name = "Generate UUID" }, f(generate_uuid)),
}

local yes, private = pcall(require, "snippets.all_private")
if yes then
  for _, v in ipairs(private) do
    table.insert(all, v)
  end
end

return all
