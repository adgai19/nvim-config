local finders = require("telescope.finders")
local sorters = require("telescope.sorters")
local actions = require("telescope.actions")
local pickers = require("telescope.pickers")
require("jdtls.ui").pick_one_async = function(items, prompt, label_fn, cb)
	local opts = {}
	pickers.new(require("telescope.themes").get_dropdown(opts), {
		prompt_title = prompt,
		finder = finders.new_table({
			results = items,
			entry_maker = function(entry)
				return {
					value = entry,
					display = label_fn(entry),
					ordinal = label_fn(entry),
				}
			end,
		}),
		sorter = sorters.get_generic_fuzzy_sorter(),
		attach_mappings = function(prompt_bufnr)
			actions.select_default:replace(function()
				local selection = actions.get_selected_entry()
				actions.close(prompt_bufnr)

				cb(selection.value)
			end)

			return true
		end,
	}):find()
end

vim.cmd([[autocmd CursorHold,CursorHoldI * lua require('code_action_utils').code_action_listener()]])

require("cmp-setup")
local config = {
	capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
}

config.cmd = {
	"java-lsp.sh",
	"/home/adgai/workspace/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t"),
}
config.root_dir = require("jdtls.setup").find_root({ ".git", "mvnw", "gradlew", "pom.xml" })
require("jdtls").start_or_attach(config)
local mapper = require("tools.utils")
mapper.nnoremap("<A-CR>", "<cmd>lua require('jdtls').code_action()<CR>")
mapper.vnoremap("<A-CR>", "<Esc><Cmd>lua require('jdtls').code_action(true)<CR>")
mapper.nnoremap("<leader>r <Cmd>lua", "require('jdtls').code_action(false, 'refactor')<CR>")
mapper.nnoremap("<A-o>", "<Cmd>lua require'jdtls'.organize_imports()<CR>")
mapper.nnoremap("crv", "<Cmd>lua require('jdtls').extract_variable()<CR>")
mapper.vnoremap("crv", "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>")
mapper.nnoremap("crc", "<Cmd>lua require('jdtls').extract_constant()<CR>")
mapper.vnoremap("crc", "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>")
mapper.vnoremap("crm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>")
mapper.nnoremap("<leader>df", "<Cmd>lua require'jdtls'.test_class()<CR>")
mapper.nnoremap("<leader>dn", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>")
