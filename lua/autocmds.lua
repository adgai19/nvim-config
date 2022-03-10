-- vim.api.nvim_create_autocmd("BufWritePost ~/.config/nvim/lua/packages.lua", { command = "source <afile>|PackerSync" })

local highlight_yank = vim.api.nvim_create_augroup("highlight_yank", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
	end,
	group = highlight_yank,
})

local markdownSpell = vim.api.nvim_create_augroup("markdownSpell", { clear = true })
-- vim.api.nvim_create_autocmd("Filetype markdown", { command = "setlocal spell", group = markdownSpell,pattern="*.md" })
--[[vim.api.nvim_create_autocmd(
	{ "Bufread", "BufNewFile " },
	{ command = "setlocal spell", pattern = "*.md", group = markdownSpell }
)]]

--local texSpell = vim.api.nvim_create_augroup("texSpell", { clear = true })
-- vim.api.nvim_create_autocmd("Filetype tex", { command = "setlocal spell", group = texSpell })
--vim.api.nvim_create_autocmd("Bufread,BufNewFile *.tex", { command = "setlocal spell", group = texSpell })
--vim.notify_once(vim.loop.os_uname().sysname)
