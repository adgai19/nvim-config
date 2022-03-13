"workman specific
nnoremap ; :
nnoremap : ;
nnoremap j e
nnoremap e j
nnoremap k n
nnoremap n k

vnoremap j e
vnoremap e j
vnoremap k n
vnoremap n k

"get out of vim quickly
nnoremap <M-q> <cmd>q<CR>
"easy ;
inoremap ;; <esc>A;<CR>

"move text in vs mode
vnoremap E :m '>+1<CR>gv=gv
vnoremap N :m '<-2<CR>gv=gv

"split management
nnoremap <Leader>= :vertical resize +5<CR>
nnoremap <Leader>- :vertical resize -5<CR>

nnoremap <Leader>h :split<cr>
nnoremap <Leader>v :vsplit<cr>

"quickly source 
nnoremap <Leader>s :w<cr>:so %<cr>
" greatest remaps ever
" xnoremap <leader>p "_dP
"
" " next greatest remaps ever : asbjornHaland
" yank remaps
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG
"
nnoremap <leader>d "_d
vnoremap <leader>d "_d

"handy replace words
nnoremap cn *``cgn
nnoremap cN *``cgN


nnoremap Q @q

nnoremap J mzJ`z


tnoremap <Esc> <C-\><C-n>


nnoremap <C-up> gt
nnoremap <C-down> gT

nnoremap <leader>m :Mkdir 

vnoremap < <gv
vnoremap > >gv
nnoremap <space>ca <esc>:lua require('code_action_menu').open_code_action_menu()<cr>
nnoremap \ :Rg<space>

" noremap <UP> <c-y>
" noremap <down> <c-e>
" clear highlight after search
"
nnoremap <expr> <CR> {-> v:hlsearch ? ":nohl\<CR>" : "\<CR>"}()
