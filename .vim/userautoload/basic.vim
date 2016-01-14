"set nocompatible        "vi互換無効
filetype off
filetype plugin indent off
"retab
syntax on
set t_Co=256
"let g:hybrid_use_Xresources = 1
"colorscheme jellybeans
"highlight Normal ctermbg=none

set encoding=utf-8
set fileencoding=utf-8
"set regexpengine=1

set mouse=a

set nowrap

"clipboardの設定
set clipboard=unnamed,unnamedplus
set clipboard+=unnamedplus

"補完関連
"set completeopt=menuone     "表示方法

set hlsearch
set ignorecase
set smartcase

"set nofoldenable        "畳み込みの無効化

set autoindent

set cursorline

set ruler
set number
set list
"set wildmenu
"set showcmd
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

autocmd FileType haskell setlocal expandtab softtabstop=2 shiftwidth=2 tabstop=2
autocmd FileType scheme setlocal expandtab softtabstop=2 shiftwidth=2 tabstop=2
autocmd FileType python setlocal expandtab softtabstop=4 shiftwidth=4 tabstop=4


"set omnifunc=syntaxcomplete#Complete
