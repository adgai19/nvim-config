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
			-- For `vsnip` user.
			vim.fn["vsnip#anonymous"](args.body)

			-- For `luasnip` user.
			require("luasnip").lsp_expand(args.body)

			-- For `ultisnips` user.
			vim.fn["UltiSnips#Anon"](args.body)
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
		--   ["<Tab>"] = cmp.mapping(function(fallback)
		--     if cmp.visible() then
		--       cmp.select_next_item()
		--     elseif luasnip.expand_or_jumpable() then
		--       luasnip.expand_or_jump()
		--     elseif has_words_before() then
		--       cmp.complete()
		--     else
		--       fallback()
		--     end
		--   end, {
		--     "i",
		--     "s",
		--   }),
		--
		--   ["<S-Tab>"] = cmp.mapping(function(fallback)
		--     if cmp.visible() then
		--       cmp.select_prev_item()
		--     elseif luasnip.jumpable(-1) then
		--       luasnip.jump(-1)
		--     else
		--       fallback()
		--     end
		--   end, {
		--     "i",
		--     "s",
		--   }),
	},
	sources = {
		{ name = "luasnip" },
		{ name = "vsnip" },
		{ name = "ultisnips" },
		{ name = "nvim_lsp" },
		{ name = "nvim_lua" },
		{ name = "buffer" },
		{ name = "path" },
	},
})
