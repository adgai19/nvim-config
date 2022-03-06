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

-- snippets
local lua_snippets = require("adgai.snippets.lua").lua_snippets
local all_snippets = require("adgai.snippets.all").snippets

ls.snippets = { all = all_snippets, lua = lua_snippets }
