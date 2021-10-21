local marks = vim.api.nvim_exec("marks", true)
local marks_table = vim.fn.split(marks, "\n")
table.remove(marks_table, 1)
local results = {}
for _, y in ipairs(marks_table) do
	local result = {}
	local delimiter = " "
	local maxsplit = 3
	local curpos = 0
	while maxsplit ~= 0 and curpos < #y do
		local found, final = string.find(y, delimiter, curpos, false)
		if found ~= nil then
			local val = string.sub(y, curpos, found - 1)

			if #val > 0 then
				maxsplit = maxsplit - 1
				table.insert(result, val)
			end

			curpos = final + 1
		else
			table.insert(result, string.sub(y, curpos))
			break
			-- curpos = curpos + 1
		end

		if maxsplit == 0 then
			table.insert(result, string.sub(y, curpos))
		end
	end
	table.insert(results, result)
end
-- print(vim.inspect(results))

local temp = {}
for index, value in ipairs(results) do
	-- print(vim.inspect(value))
	if value[1]:match("[%a]") then
		-- print("added")
		table.insert(temp, { value[1], value[2], value[3] })
	end
end
-- print(vim.inspect(temp))
local bnr = vim.fn.bufnr("%")
local ns_id = vim.api.nvim_create_namespace("demo")
for index, value in ipairs(temp) do
	local line_num = tonumber(value[2]) - 1
	local col_num = tonumber(value[3])
	local opts = {
		id = index,
		virt_text = { { string.format("mark %s", value[1]), "IncSearch" } },
		virt_text_pos = "right_align",
	}
	vim.api.nvim_buf_set_extmark(bnr, ns_id, line_num, col_num, opts)
end
