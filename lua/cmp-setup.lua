local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- Setup nvim-cmp.
local cmp = require("cmp")
local lspkind = require("lspkind")
cmp.setup({
	snippet = {
		expand = function(args)
			-- vim.fn["vsnip#anonymous"](args.body)
			require("luasnip").lsp_expand(args.body)
			-- vim.fn["UltiSnips#Anon"](args.body)
		end,
	},
	formatting = {
		format = lspkind.cmp_format(),
	},
	mapping = {
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
		["<C-y>"] = cmp.mapping.confirm({ select = true }),
	},
	sources = {
		{ name = "luasnip" },
		{ name = "nvim_lua", max_item_count = 10 },
		{ name = "nvim_lsp", max_item_count = 10 },
		{ name = "buffer", keyword_length = 4 },
		{ name = "path", keyword_length = 4 },
	},
})
