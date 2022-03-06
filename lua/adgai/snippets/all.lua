local ls = require("luasnip")
local s = ls.s
local fmt = require("luasnip.extras.fmt").fmt
local i = ls.insert_node
local rep = require("luasnip.extras").rep

local snippets = {
	ls.parser.parse_snippet("expand", "-- test snippet"),
}
return { snippets = snippets }
