local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
-- Setup nvim-cmp.
--

local cmp = require("cmp")
-- local lspkind = require("lspkind")
local luasnip = require("luasnip")
local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end
local kind_icons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "ﴯ",
	Interface = "",
	Module = "",
	Property = "ﰠ",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}
cmp.setup({
	snippet = {
		expand = function(args)
			-- vim.fn["vsnip#anonymous"](args.body)
			require("luasnip").lsp_expand(args.body)
			-- vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
	formatting = {
		format = function(entry, vim_item)
			-- Kind icons
			vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
			-- Source
			vim_item.menu = ({
				buffer = "[Buffer]",
				nvim_lsp = "[LSP]",
				luasnip = "[LuaSnip]",
				nvim_lua = "[Lua]",
				latex_symbols = "[LaTeX]",
			})[entry.source.name]
			return vim_item
		end,
	},
	mapping = {
		-- ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
		-- ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
		-- ["<Down>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
		-- ["<Up>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		-- ["<CR>"] = cmp.mapping.confirm({
		-- 	behavior = cmp.ConfirmBehavior.Replace,
		-- 	select = true,
		-- }),

		["<C-y>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		-- ["<Tab>"] = cmp.mapping(function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.select_next_item()
		-- 		-- elseif luasnip.expand_or_jumpable() then
		-- 		-- 	luasnip.expand_or_jump()
		-- 		-- elseif has_words_before() then
		-- 		-- 	cmp.complete()
		-- 	else
		-- 		fallback()
		-- 	end
		-- end, {
		-- 	"i",
		-- 	"s",
		-- }),
		--
		-- ["<S-Tab>"] = cmp.mapping(function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.select_prev_item()
		-- 		-- elseif luasnip.jumpable(-1) then
		-- 		-- 	luasnip.jump(-1)
		-- 	else
		-- 		fallback()
		-- 	end
		-- end, {
		-- 	"i",
		-- 	"s",
		-- }),
	},
	sources = {
		-- { name = "luasnip", max_item_count = 4 },
		{ name = "nvim_lsp_signature_help" },
		-- { name = "ultisnips", max_item_count = 6 }, -- For ultisnips users.{}
		{ name = "nvim_lua", max_item_count = 10 },
		{ name = "nvim_lsp", max_item_count = 12 },
		{ name = "buffer", keyword_length = 2, max_item_count = 3 },
		{ name = "cmp_tabnine", max_item_count = 2, keyword_length = 3 },
		{ name = "path", keyword_length = 2, max_item_count = 3 },
	},
})
require("cmp").setup.cmdline(":", {
	sources = {
		{ name = "cmdline" },
	},
})
require("cmp").setup.cmdline("/", {
	sources = {
		{ name = "buffer" },
	},
})
