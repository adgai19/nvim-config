" augroup markdownSpell
"     autocmd!
"     autocmd FileType markdown setlocal spell
"     autocmd BufRead,BufNewFile *.md setlocal spell
" augroup END

" augroup texspell
"     autocmd!
"     autocmd FileType tex setlocal spell
"     autocmd BufRead,BufNewFile *.tex setlocal spell
" augroup END

noremap <silent> <Leader>w :call ToggleWrap()<CR>
function ToggleWrap()
  if &wrap
    echo "Wrap OFF"
    setlocal nowrap
    set virtualedit=all
    silent! nunmap <buffer> <Up>
    silent! nunmap <buffer> <Down>
    silent! nunmap <buffer> <Home>
    silent! nunmap <buffer> <End>
    silent! iunmap <buffer> <Up>
    silent! iunmap <buffer> <Down>
    silent! iunmap <buffer> <Home>
    silent! iunmap <buffer> <End>
  else
    echo "Wrap ON"
    setlocal wrap linebreak nolist
    set virtualedit=
    setlocal display+=lastline
    noremap  <buffer> <silent> <Up>   gk
    noremap  <buffer> <silent> <Down> gj
    noremap  <buffer> <silent> <Home> g<Home>
    noremap  <buffer> <silent> <End>  g<End>
    inoremap <buffer> <silent> <Up>   <C-o>gk
    inoremap <buffer> <silent> <Down> <C-o>gj
    inoremap <buffer> <silent> <Home> <C-o>g<Home>
    inoremap <buffer> <silent> <End>  <C-o>g<End>
  endif
endfunction

" augroup fmt
"   autocmd!
"   autocmd BufWritePre * undojoin | Neoformat
" augroup END
augroup fmt
  autocmd!
  au BufWritePre * try | undojoin | Neoformat | catch /^Vim\%((\a\+)\)\=:E790/ | finally | silent Neoformat | endtry
augroup END

" augroup qflist
"   autocmd!
"   au BufReadPost quickfix lua require('adgai.cyclekeymaps').change_mode()
" augroup END

augroup linters
  autocmd!
  au BufWritePost	lua vim.diagnostic.setloclist()
  au BufWritePost	lua require('adgai.cyclekeymaps').change_mode("ll")
augroup END
