let g:neoformat_lua_luaformatter = {
      \ 'exe': 'luaformatter',
      \ 'args': ['--spaces 4'],
      \ }

let g:neoformat_xml_tidy = {
      \ 'exe': 'tidy',
      \ 'args': ['-quiet',
      \          '-xml',
      \          '-utf8',
      \          '-wrap 160',
      \          '--indent auto',
      \          '--indent-spaces 2',
      \          '--vertical-space yes',
      \          '--tidy-mark no',
      \          '--indent-cdata yes',
      \          '--add-xml-decl yes'
      \         ],
      \ 'stdin': 1,
      \ }

let g:neoformat_enabled_json = ['jq']
