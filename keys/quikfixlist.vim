" qf list
nnoremap <M-e> :cnext<CR>
nnoremap <M-o> :cprevious<CR>
nnoremap <M-c> :cclose<CR>

nnoremap <leader>lk :lnext<CR>
nnoremap <leader>lo :lprevious<CR>
nnoremap <leader>lt :lclose<CR>

" nnoremap <F5> :make<CR>
" nnoremap <F4> :make -C build<CR>
"*******************************************************
"floterm keymaps

" let g:NERDCreateDefaultMappings = 1



" nnoremap <leader>h <C-W>s
" nnoremap <leader>v <C-W>v
" nnoremap <leader>n :NERDTreeToggle<CR>
" nnoremap <leader>t; :FloatermNew<CR>
" nnoremap <leader>ty :FloatermNew ytop<CR>
" nnoremap <leader>tp :FloatermNew python<CR>
" nnoremap <leader>tn :FloatermNew node<CR>
" nnoremap <leader>ts :FloatermNew ncdu<CR>
" nnoremap <leader>/ :call NERDComment("n","Toggle")<CR>
"
" nnoremap <leader>wz :MaximizerToggle<CR>
"
vnoremap J :m '>+1<CR>gv=gv
"
vnoremap K :m '<-2<CR>gv=gv
