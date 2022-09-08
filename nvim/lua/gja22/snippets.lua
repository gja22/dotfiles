local ls = require("luasnip")

ls.snippets = {
  all = {
    -- Available in any filetype
    ls.parser.parse_snippet("expand", "-- this is what was expanded"),

  },

  golang = {
    -- golang specific snippets go here
  },
}


