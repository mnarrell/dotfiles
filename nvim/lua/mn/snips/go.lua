local ls = require("luasnip")
local s = ls.s
local i = ls.insert_node
local t = ls.text_node
local f = ls.function_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

local go = {
  s(
    { trig = "json", name = "JSON struct tag", dscr = [[`json:"fieldName"`]] },
    f(function()
      local matched = string.match(vim.api.nvim_get_current_line(), "%w+")
      if not matched then
        return ""
      end
      return string.format([[`json:"%s"`]], matched:gsub("^%u", string.lower))
    end)
  ),

  s({ trig = "anon", name = "Anonymous func" }, { i(1, "fn"), t({ " := func() {", "	" }), i(2), t({ "", "}" }) }),

  s({ trig = "ap=", name = "Append to slice" }, { i(1, "slice"), t(" = append("), rep(1), t(", "), i(0), t(")") }),

  s(
    { trig = "const", name = "Constant block" },
    { t({ "const (", "	" }), i(1, "NAME"), i(2, " Type"), t(" = "), i(3, "value"), t({ "", ")" }) }
  ),

  s(
    { trig = "iota", name = "Enumeration" },
    { t({ "const (", "	" }), i(1, "NAME"), i(2, " Type"), t(" = iota"), t({ "", ")" }) }
  ),

  s({ trig = "def", name = "Defer func" }, { t({ "defer func() {", "	" }), i(0), t({ "", "}()" }) }),

  s({ trig = "import", name = "Import block" }, { t({ "import (", "" }), i(1, [["package"]]), t({ "", ")" }) }),

  s(
    { trig = "interface", name = "Interface definition" },
    { t("type "), i(1, "Interface"), t({ " interface {", "	" }), i(2, [[/* TODO: add methods */]]), t({ "", "}" }) }
  ),

  s(
    { trig = "if", name = "Conditional block" },
    { t("if "), i(1, "condition"), t({ " {", "	" }), i(0), t({ "", "}" }) }
  ),

  s(
    { trig = "ife", name = "Inline conditional" },
    { t("if err := "), i(1), t({ "; err != nil {", "	" }), i(0), t({ "", "}" }) }
  ),

  s(
    { trig = "errn", name = "Basic error handling" },
    t({
      "if err != nil {",
      "	return err",
      "}",
      "",
    })
  ),

  s(
    { trig = "errn,", name = "Error with two return values" },
    { t({ "if err != nil {", "	return " }), i(1, "nil"), t(", "), i(2, "err"), t({ "", "}" }) }
  ),

  s(
    { trig = "errh", name = "Error handle and return" },
    { t({ "if err != nil {", "	" }), i(1), t({ "", "	return", "}" }), i(0) }
  ),

  s(
    { trig = "fori", name = "Basic for loop" },
    fmt(
      [[
          for {} := 0; {} < {}; {}++ {{
            {}
          }}
      ]],
      { i(1, "i"), rep(1), i(2, "N"), rep(1), i(0) }
    )
  ),

  s(
    { trig = "forr", name = "Ranged for loop" },
    fmt(
      [[
          for {}, {} := range {} {{
            {}
          }}
      ]],
      { i(2, "k"), i(3, "v"), i(1), i(0) }
    )
  ),

  s(
    { trig = "forsel", name = "for select" },
    fmt(
      [[
        for {{
          select {{
            case {} := <-{}:
            {}
          }}
        }}
      ]],
      { i(1, "result"), i(2, "channel"), i(0) }
    )
  ),

  s(
    { trig = "func", name = "Function definition" },
    { t("func "), i(1, "name"), t("("), i(2, "params"), t(") "), i(3), t({ "{", "" }), i(0), t({ "", "}" }) }
  ),

  s({ trig = "ff", name = "Print Variable" }, fmt([[fmt.Printf("{} = %+v\n", {})]], { i(1), rep(1) })),

  s({ trig = "fn", name = "Print statement" }, { t([[fmt.Println("]]), i(1), t([[")]]) }),

  s({ trig = "fe", name = "fmt.Errorf" }, { t([[fmt.Errorf("]]), i(1), t([[")]]) }),

  s(
    { trig = "few", name = "fmt.Errorf(%w, err)" },
    { t([[fmt.Errorf("]]), i(1, "message"), t([[: %w", ]]), i(2, "err"), t(")") }
  ),

  s({ trig = "ln", name = "log.Println" }, { t([[log.Println("]]), i(1), t([[")]]) }),

  s({ trig = "main", name = "Main function" }, { t({ "func main() {", "	" }), i(1), t({ "", "}" }) }),

  s(
    { trig = "meth", name = "Method definition" },
    fmt(
      [[
        func ({} {}) {}({}) {} {{
          {}
        }}
      ]],
      { i(1, "receiver"), i(2, "type"), i(3, "name"), i(4, "params"), i(5), i(0) }
    )
  ),

  s({ trig = "ok", name = "Basic ok handling" }, { t({ "if !ok {", "	" }), i(1), t({ "", "}" }) }),

  s({ trig = "st", name = "Struct block" }, { t("type "), i(1, "Type"), t({ " struct {", "" }), i(0), t({ "", "}" }) }),

  s(
    { trig = "switch", name = "Switch block" },
    { t("switch "), i(1, "var"), t({ " {", "	case " }), i(2), t({ ":", "	" }), i(0), t({ "", "}" }) }
  ),

  s({ trig = "sp", name = "fmt.Sprintf" }, { t([[fmt.Sprintf("%]]), i(1, "s"), t([[", ]]), i(2, "var"), t(")") }),

  s({ trig = "gof", name = "Inline goroutine" }, { t({ "go func() {", "	" }), i(1), t({ "", "}()", "" }), i(0) }),

  s(
    { trig = "test", name = "Unit test" },
    { t("func Test"), i(1, "Function"), t({ "(t *testing.T) {", "	" }), i(0), t({ "", "}" }) }
  ),

  s(
    { trig = "tt", name = "Table tests" },
    fmt(
      [[
        var tests = []struct {{
          name string
        }}{{
          {{"{}"}},
        }}
        for _, tt := range tests {{
          tt := tt
          t.Run(tt.name, func(t *testing.T) {{
            {}
          }})
        }}
      ]],
      { i(1), i(0) }
    )
  ),

  s({ trig = "rne", name = "require.NoError" }, t("require.NoError(t, err)")),

  s({ trig = "hf", name = "http.HandlerFunc" }, {
    t("func "),
    i(1, "handler"),
    t({ "(out http.ResponseWriter, req *http.Request) {", "	" }),
    i(0, [[fmt.Fprintf(out, "OHAI!")]]),
    t({ "", "}" }),
  }),

  s({ trig = "rhf", name = "httprouter.Handle" }, {
    t("func "),
    i(1, "handler"),
    t({ "(out http.ResponseWriter, req *http.Request, params httprouter.Params) {", "	" }),
    i(0, [[fmt.Fprintf(out, "OHAI!")]]),
    t({ "", "}" }),
  }),

  s({ trig = "tsrv", name = "httptest.NewServer" }, {
    t({
      "ts := httptest.NewServer(http.HandlerFunc(func(out http.ResponseWriter, req *http.Request) {",
      "	fmt.Fprintln(out, ",
    }),
    i(1, [["ohai"]]),
    t({ ")", "}))", "defer ts.Close()" }),
  }),

  s(
    { trig = "vars", name = "Variable block" },
    fmt(
      [[
        var (
          {} {} = {}
        )
      ]],
      { i(1, "x"), i(2, "Type"), i(0, "value") }
    )
  ),
}

return go
