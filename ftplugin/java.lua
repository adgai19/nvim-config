local finders = require 'telescope.finders'
local sorters = require 'telescope.sorters'
local actions = require 'telescope.actions'
local pickers = require 'telescope.pickers'
require('jdtls.ui').pick_one_async = function(items, prompt, label_fn, cb)
    local opts = {}
    pickers.new(require('telescope.themes').get_dropdown( opts ), {
        prompt_title = prompt,
        finder = finders.new_table {
            results = items,
            entry_maker = function(entry)
                return {
                    value = entry,
                    display = label_fn(entry),
                    ordinal = label_fn(entry)
                }
            end
        },
        sorter = sorters.get_generic_fuzzy_sorter(),
        attach_mappings = function(prompt_bufnr)
            actions.select_default:replace(
                function()
                    local selection = actions.get_selected_entry(prompt_bufnr)
                    actions.close(prompt_bufnr)

                    cb(selection.value)
                end)

            return true
        end
    }):find()
end

require'compe'.setup {
    enabled = true,
    autocomplete = true,
    debug = false,
    min_length = 1,
    preselect = 'enable',
    throttle_time = 80,
    source_timeout = 200,
    resolve_timeout = 800,
    incomplete_delay = 400,
    max_abbr_width = 100,
    max_kind_width = 100,
    max_menu_width = 100,
    documentation = {
        border = {'', '', '', ' ', '', '', '', ' '}, -- the border option is the same as `|help nvim_open_win|`
        winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
        max_width = 120,
        min_width = 60,
        max_height = math.floor(vim.o.lines * 0.3),
        min_height = 1
    },

    source = {
        path = true,
        buffer = true,
        calc = true,
        vsnip = false,
        nvim_lsp = true,
        nvim_lua = true,
        spell = true,
        tags = true,
        snippets_nvim = false,
        treesitter = true
    }
}
-- require('jdtls').start_or_attach({cmd = {'java-lsp.sh'}})

local config = {}
config.cmd = {
    'java-lsp.sh',
    '/home/adgai/workspace/' .. vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')
}

require('jdtls').start_or_attach(config)
local mapper = require("tools.utils")
mapper.nnoremap("<A-CR>", "<cmd>lua require('jdtls').code_action()<CR>")
mapper.nnoremap("<A-CR>", "<Cmd>lua require('jdtls').code_action()<CR>")
mapper.vnoremap("<A-CR>", "<Esc><Cmd>lua require('jdtls').code_action(true)<CR>")
mapper.nnoremap("<leader>r <Cmd>lua",
                "require('jdtls').code_action(false, 'refactor')<CR>")
mapper.nnoremap("<A-o>", "<Cmd>lua require'jdtls'.organize_imports()<CR>")
mapper.nnoremap("crv", "<Cmd>lua require('jdtls').extract_variable()<CR>")
mapper.vnoremap("crv",
                "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>")
mapper.nnoremap("crc", "<Cmd>lua require('jdtls').extract_constant()<CR>")
mapper.vnoremap("crc",
                "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>")
mapper.vnoremap("crm", "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>")
mapper.nnoremap("<leader>df", "<Cmd>lua require'jdtls'.test_class()<CR>")
mapper.nnoremap("<leader>dn",
                "<Cmd>lua require'jdtls'.test_nearest_method()<CR>")
