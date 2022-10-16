local ls = require("luasnip")

-- Some shorthands
local s = ls.snippet
local t = ls.text_node

ls.config.set_config({

    -- remember last snippet so you can jump bakc into it
    history = true,

    -- update snippets as you type
    updateevents = "TextChanged,TextChangedI",

    -- Autosnippets
    enable_autosnippets = false,

})

ls.add_snippets(
    "all",
    {
        s("simple", { t("wow, you were right"), }),
        s("fred", { t("fred flintstone"), }),
    }
)
