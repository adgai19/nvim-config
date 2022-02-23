local present, ls = pcall(require, "luasnip")
if not present then
	vim.notify("luasnip not loaded")
	return
end
vim.notify("luasnip loaded")

-- settings
ls.config.set_config({
	history = true,
	updateevents = "TextChanged,TextChangedI",
	region_check_events = nil,
	enable_autosnippets = nil,
	ext_opts = nil,
})
vim.keymap.set({ "i", "s" }, "<m-n>", function()
	if ls.expand_or_jumpable() then
		ls.expand_or_jump()
	end
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<m-e>", function()
	if ls.jumpable(-1) then
		ls.jump(-1)
	end
end, { silent = true })
vim.keymap.set({ "i", "s" }, "<m-k>", function()
	if ls.choice_active(-1) then
		ls.change_choice(-1)
	end
end, { silent = true })

local s = ls.s
local fmt = require("luasnip.extras.fmt").fmt
local i = ls.insert_node
local rep = require("luasnip.extras").rep

-- snippest start here
local lua_snippets = {
	s("lr", fmt("local {} = require('{}')", { i(1, "package"), rep(1) })),
	s("lf", fmt("local {}=function({})\n{}\nend", { i(1), i(2), i(3) })),
}

ls.snippets = { all = { ls.parser.parse_snippet("expand", "-- test snippet") }, lua = lua_snippets }
