local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
-- Setup nvim-cmp.
local cmp = require("cmp")
local lspkind = require("lspkind")
local luasnip = require("luasnip")
local t = function(str)
	return vim.api.nvim_replace_termcodes(str, true, true, true)
end
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
		-- ["<Tab>"] = cmp.mapping({
		-- 	c = function()
		-- 		if cmp.visible() then
		-- 			cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
		-- 		elseif luasnip.expand_or_jumpable() then
		-- 			luasnip.expand_or_jump()
		-- 		else
		-- 			cmp.complete()
		-- 		end
		-- 	end,
		-- 	i = function(fallback)
		-- 		if cmp.visible() then
		-- 			cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
		-- 		elseif luasnip.expand_or_jumpable() then
		-- 			luasnip.expand_or_jump()
		-- 		elseif vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
		-- 			vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), "m", true)
		-- 		else
		-- 			fallback()
		-- 		end
		-- 	end,
		-- 	s = function(fallback)
		-- 		if vim.fn["UltiSnips#CanJumpForwards"]() == 1 then
		-- 			vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_forward)"), "m", true)
		-- 		elseif luasnip.expand_or_jumpable() then
		-- 			luasnip.expand_or_jump()
		-- 		else
		-- 			fallback()
		-- 		end
		-- 	end,
		-- }),
		-- ["<S-Tab>"] = cmp.mapping({
		-- 	c = function()
		-- 		if cmp.visible() then
		-- 			cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
		-- 		elseif luasnip.expand_or_jumpable() then
		-- 			luasnip.expand_or_jump()
		-- 		else
		-- 			cmp.complete()
		-- 		end
		-- 	end,
		-- 	i = function(fallback)
		-- 		if cmp.visible() then
		-- 			cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
		-- 		elseif luasnip.expand_or_jumpable() then
		-- 			luasnip.expand_or_jump()
		-- 		elseif vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
		-- 			return vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_backward)"), "m", true)
		-- 		else
		-- 			fallback()
		-- 		end
		-- 	end,
		-- 	s = function(fallback)
		-- 		if vim.fn["UltiSnips#CanJumpBackwards"]() == 1 then
		-- 			return vim.api.nvim_feedkeys(t("<Plug>(ultisnips_jump_backward)"), "m", true)
		-- 		elseif luasnip.expand_or_jumpable() then
		-- 			luasnip.expand_or_jump()
		-- 		else
		-- 			fallback()
		-- 		end
		-- 	end,
		-- }), --
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif has_words_before() then
				cmp.complete()
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),

		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {
			"i",
			"s",
		}),
	},
	sources = {
		{ name = "luasnip" },
		{ name = "ultisnips" }, -- For ultisnips users.{}
		{ name = "nvim_lua", max_item_count = 10 },
		{ name = "nvim_lsp", max_item_count = 12 },
		{ name = "buffer", keyword_length = 2, max_item_count = 3 },
		{ name = "path", keyword_length = 2, max_item_count = 3 },
	},
})
require("luasnip/loaders/from_vscode").lazy_load() -- You can pass { path = "./my-snippets/"} as well

vim.cmd([[
  imap <silent><expr> <c-k> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<c-k>'
  inoremap <silent> <c-j> <cmd>lua require('luasnip').jump(-1)<CR>

  imap <silent><expr> <C-l> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-l>'

  snoremap <silent> <c-k> <cmd>lua require('luasnip').jump(1)<CR>
  snoremap <silent> <c-j> <cmd>lua require('luasnip').jump(-1)<CR>
]])
