return {
  {
    "johmsalas/text-case.nvim",
    keys = {
      { "gau", ":lua require('textcase').current_word('to_upper_case')<CR>" },
      { "gal", ":lua require('textcase').current_word('to_lower_case')<CR>" },
      { "gas", ":lua require('textcase').current_word('to_snake_case')<CR>" },
      { "gad", ":lua require('textcase').current_word('to_dash_case')<CR>" },
      { "gan", ":lua require('textcase').current_word('to_constant_case')<CR>" },
      { "gad", ":lua require('textcase').current_word('to_dot_case')<CR>" },
      { "gaa", ":lua require('textcase').current_word('to_phrase_case')<CR>" },
      { "gac", ":lua require('textcase').current_word('to_camel_case')<CR>" },
      { "gap", ":lua require('textcase').current_word('to_pascal_case')<CR>" },
      { "gat", ":lua require('textcase').current_word('to_title_case')<CR>" },
      { "gaf", ":lua require('textcase').current_word('to_path_case')<CR>" },
    },
  },
}
