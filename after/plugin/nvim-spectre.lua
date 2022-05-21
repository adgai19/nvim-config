local nnoremap = require("keymaps.helpers").nnoremap
local vnoremap = require("keymaps.helpers").vnoremap
nnoremap("<leader>S", require("spectre").open)

nnoremap("<leader>sw", "<cmd>lua require('spectre').open_visual({select_word=true)")
vnoremap("<leader>s", require("spectre").open_visual)
nnoremap("<leader>sp", "viw:lua require('spectre').open_file_search()<cr>")
