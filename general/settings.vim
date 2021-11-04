" set leader key
let g:mapleader = "\<Space>"

syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open multiple buffers
set autowrite
set nowrap                              " Display long lines as just one line
set encoding=utf-8                      " The encoding displayed
set pumheight=30                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler                               " Show the cursor position all the time
"set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                        " treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set softtabstop=2
set tabstop=2                           " Insert 2 spaces for a tab
set shiftwidth=2                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=0                        " Always display the status line
set number                              " Line numbers
set cursorline                          " Enable highlighting of the current line
set background=dark                     " tell vim what the background color looks like
set showtabline=2                       " Always show tabs
"set noshowmode                          " We don't need to see things like -- INSERT -- anymore
" set nobackup                            " This is recommended by coc
" set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set formatoptions-=cro                  " Stop newline continution of comments
set clipboard=unnamedplus               " Copy paste between vim and everything else
set hlsearch=false
set smartcase=true
" set wildoptions+=pum
"set wildmode=
" set wildmode=longest:full,full

set lazyredraw
" set nowraplines
set completeopt=menuone,noselect
"set nowildmenu
set noswapfile
set ignorecase
"set scrolloff=12
set autochdir                           " Your working directory will always be the same as your working directory
" set wildmode=longest,list,full
au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC
set incsearch
set confirm
"autocmd VimEnter *
"  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
"  \|   PlugInstall --sync | q
"  \| endif
" You can't stop me
" cmap w!! w !sudo tee %
" let g:airline#extensions#tabline#formatter = 'default'
" let g:airline_powerline_fonts = 1
set showtabline=0
set nocompatible
" let g:CtrlSpaceDefaultMappingKey = "<C-space> "
let g:CtrlSpaceFileEngine = "auto""
au ColorScheme * hi Normal ctermbg=none guibg=none
"let g:kite_supported_languages = ['python', 'javascript','go']
"
" let g:kite_supported_languages = ['*']
"au BufWrite * :Autoformat
" autocmd FileType javascript let b:coc_suggest_disable=1
" let g:auto_comma_or_semicolon_events = ["InsertLeave"]
let g:tmux_navigator_save_on_switch = 2
autocmd FileType markdown setlocal spell

set number relativenumber

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
" let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|.git'

set shell=/bin/bash
" autocmd FileType yml let b:autoformat_autoindent=0
let g:python3_host_prog="/usr/bin/python3"
set termguicolors
colorscheme tokyonight
set background=dark
"autocmd BufEnter * lua require'completion'.on_attach()
" imap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

