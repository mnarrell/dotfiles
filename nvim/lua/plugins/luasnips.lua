return {
  "L3MON4D3/LuaSnip",
  lazy = true,
  config = function()
    local ls = require "luasnip"

    ls.add_snippets("all", R "snippets.all")
    ls.add_snippets("go", R "snippets.go")
    ls.add_snippets("lua", R "snippets.lua")
    ls.add_snippets("markdown", R "snippets.markdown")
    ls.add_snippets("sh", R "snippets.sh")

    -- <c-k> is my expansion key
    -- this will expand the current item or jump to the next item within the snippet.
    vim.keymap.set({ "i", "s" }, "<c-k>", function()
      if ls.expand_or_jumpable() then
        ls.expand_or_jump()
      end
    end, {
      silent = true,
    })

    -- <c-j> is my jump backwards key.
    -- this always moves to the previous item within the snippet
    vim.keymap.set({ "i", "s" }, "<c-j>", function()
      if ls.jumpable(-1) then
        ls.jump(-1)
      end
    end, {
      silent = true,
    })

    -- <c-l> is selecting within a list of options.
    vim.keymap.set("i", "<c-l>", function()
      if ls.choice_active() then
        ls.change_choice(1)
      end
    end)
  end,
}
