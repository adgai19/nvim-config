" file nav
nnoremap <leader>nt :lua require("harpoon.ui").nav_file(1)<cr>
nnoremap <leader>nn :lua require("harpoon.ui").nav_file(2)<cr>
nnoremap <leader>nh :lua require("harpoon.ui").nav_file(3)<cr>
nnoremap <leader>ne :lua require("harpoon.ui").nav_file(4)<cr>

nnoremap <leader>na :lua require("harpoon.mark").add_file()<cr>
nnoremap <leader>ni :lua require("harpoon.ui").toggle_quick_menu()<cr>
nnoremap <leader>np :lua require("harpoon.cmd-ui").toggle_quick_menu()<cr>

"term nav
" execute and go to term
nnoremap <silent> <leader>ns :lua require("harpoon.term").sendCommand(1, 1)<CR>:lua require("harpoon.term").gotoTerminal(1)<CR>a<CR>
nnoremap <silent> <leader>nf :lua require("harpoon.term").sendCommand(2, 2)<CR>:lua require("harpoon.term").gotoTerminal(4)<CR>a<CR>
nnoremap <silent> <leader>nr :lua require("harpoon.term").sendCommand(1, 3)<CR>:lua require("harpoon.term").gotoTerminal(4)<CR>a<CR>
nnoremap <silent> <leader>nu :lua require("harpoon.term").sendCommand(2, 4)<CR>:lua require("harpoon.term").gotoTerminal(4)<CR>a<CR>

" go to term
nnoremap <silent> <leader>nc :lua require("harpoon.term").gotoTerminal(1)<CR>a<CR>
nnoremap <silent> <leader>nk :lua require("harpoon.term").gotoTerminal(2)<CR>a<CR>

