local ls = require("luasnip")

local s = ls.s
local fmt = require("luasnip.extras.fmt").fmt
local i = ls.insert_node
local rep = require("luasnip.extras").rep
local lua_snippets = {
	s("lr", fmt("local {} = require('{}')", { i(1, "package"), rep(1) })),
	s("lf", fmt("local {}=function({})\n{}\nend", { i(1), i(2), i(3) })),
	s("req", fmt("local {}=require('{}')", { i(1), rep(1) })),
}
return { lua_snippets = lua_snippets }
