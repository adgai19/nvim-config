au TabLeave * let g:lasttab = tabpagenr()
nnoremap <silent> <c-s> :exe "tabn ".g:lasttab<cr>
nnoremap <leader>t :tabnew<CR>

vnoremap <silent> <c-s> :exe "tabn ".g:lasttab<cr>
