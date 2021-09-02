-- local notify = vim.notify
-- local level = vim.lsp.log_levels
-- notify("hello world", level.INFO)
local lines = vim.fn.getline(".")

print(lines)

local function mysplit(inputstr, sep)
	if sep == nil then
		sep = "%s"
	end
	local t = {}
	for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
		table.insert(t, str)
	end
	return t
end
lines = string.gsub(lines, '"', "")
lines = string.gsub(lines, "nnoremap ", "")
lines = mysplit(lines)
print(vim.inspect(lines))
local newline = string.format('"%s","%s"', lines[1], lines[3])
print(newline)
vim.fn.setreg("+", newline)
