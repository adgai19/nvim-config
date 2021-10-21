autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

set foldlevelstart=20
let g:ale_set_loclist = 1
"let g:ale_open_list = 1
"let g:ale_keep_list_window_open = 1
"let g:ale_set_quickfix = 1
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
let g:ale_lint_on_text_changed = 'never'
let g:airline#extensions#ale#enabled = 1
let g:flake8_show_in_gutter=1  " show
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 1

let g:ale_lint_on_text_changed='always'
" jsx file settings
"
augroup FiletypeGroup
    autocmd!
    au BufNewFile,BufRead *.jsx set filetype=javascript.jsx
augroup END
let g:ale_fixers={'python':['autoimport','black','yapf','isort'],'c':['astyle'],'go':['gofmt','goimports']}
let g:ale_linter_aliases = {'jsx': ['css', 'javascript']}
let g:ale_linters = {'jsx': ['stylelint', 'eslint']}
nnoremap  aj :ALENext<CR>
nnoremap  ak :ALEPrevious<CR>
