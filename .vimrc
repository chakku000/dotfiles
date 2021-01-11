let mapleader = ','

" TODO read only when on iTerm2
"source $HOME/develop/dotfiles/vim/iterm.vim
"set runtimepath+=~/develop/dotfiles
"runtime! vim/*.vim

augroup ColorSetting
    autocmd!
augroup END


"=======================
" encoding
"=======================
set fileencoding=utf-8
set encoding=utf-8
scriptencoding=utf-8

"======================
" row number
"======================
set number
set relativenumber

"=====================
" Indent
"=====================
set autoindent
set smartindent
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4

"===============
" 可視化
"===============
set list    "改行可視化
"set listchars=tab:>-,trail:-,extends:▷,precedes:◁,nbsp:%,eol:$
set listchars=tab:>-,extends:▷,precedes:◁,nbsp:%,eol:$
set cursorline

"====================
" 括弧
"====================
set showmatch
set matchtime=1

"===================
" 操作
"===================
set backspace=indent,eol,start "バックスペースで空白等を消去可能
set mouse=a

"===================
" 検索
"==================
"小文字の検索でも大文字も見つかるように
set ignorecase
"大文字が入力された場合は小文字と大文字を区別
set smartcase
"エンターキーで確定する前から文字が入力されるたびに検索する
set incsearch
"検索文字列をハイライト
set hlsearch
"最後まで検索したら先頭に戻る
set wrapscan

"====================
"  折り畳み
"====================
set foldmethod=marker

"====================
" コマンドライン等
"====================
set wildmenu
"set wildmode=longest:full:full
set laststatus=2 "常にステータス行を表示
"option.txt laststatusにあるlast windowってどのウィンドウのことを意味してるの?
"set cmdheight=2     "コマンド行の高さ2
set showcmd
set title "タイトル表示
set titlelen=95

"=================
" Mapping
"=================
"インクリメント
nnoremap + <C-a>
"デクリメント
nnoremap - <C-x>

" visual/normal modeでCtrl-pで0レジスタを貼り付ける
" yによる削除は0レジスタに入るがdによる削除では0レジスタに入らないので便利
vnoremap <silent> <C-p> "0p<CR>
nnoremap <silent> <C-p> "0p<CR>

"====================
" others
"====================
set clipboard=unnamed
set ttimeout
set ttimeoutlen=0

"----------
" dein
"----------
if &compatible
  set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
  call dein#begin('~/.cache/dein')

  call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
  if !has('nvim')
    call dein#add('roxma/nvim-yarp')
    call dein#add('roxma/vim-hug-neovim-rpc')
  endif

  let s:toml_dir = expand('~/develop/dotfiles/vim')
  let s:toml =  s:toml_dir . '/plugins.toml'
  let s:lazy_toml = s:toml_dir . '/lazy.toml'
  call dein#load_toml(s:toml, {'lazy': 0})
  call dein#load_toml(s:toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif

let g:dein#auto_recache = 1

filetype plugin indent on
syntax enable
