"分割した設定ファイルをすべて読み込む
"set runtimepath+=~/.vim/
"runtime! userautoload/*.vim

"=======================
" encoding
"=======================
set fileencoding=utf-8
set encoding=utf-8
scriptencoding=utf-8

"=======================
" compatible
"=======================
if &compatible && has('vim_starting')
  set nocompatible
endif

"=======================
"User Setting(色関係)
"=======================
set t_Co=256
set t_ut=
colorscheme jellybeans

"======================
"User Setting(行番号)
"======================
set number
set relativenumber

"=====================
"インデント
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
set laststatus=2 "常にステータス行を表示
"option.txt laststatusにあるlast windowってどのウィンドウのことを意味してるの?
"set cmdheight=2     "コマンド行の高さ2
set showcmd
set title "タイトル表示
set titlelen=95

"=================
"  キーバインド
"=================
"インクリメント
nnoremap + <C-a>
"デクリメント
nnoremap - <C-x>
"Shift+Tabで左に移動
inoremap <S-Tab> <Esc>lli
nnoremap <S-Tab> <S-a>
"<C-l>,<C-h>でウィンドウ間の移動
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
inoremap {<Enter> {}<Left><CR><ESC><S-o>

"括弧を入力後<Enter>を押した時に改行もする
inoremap {<Enter> {}<Left><CR><ESC><S-o>

"====================
" clipboard
"====================
set clipboard=unnamedplus

"====================
" 自動処理イベント
"====================
augroup MyAutoCmd
  "複数回の実行に備えて一括解除
  autocmd!
augroup END

autocmd MyAutoCmd FileType vim  setlocal tabstop=2 shiftwidth=2
autocmd MyAutoCmd FileType text setlocal tabstop=2 shiftwidth=2
autocmd MyAutoCmd FileType asm  imap <F1> <Plug>CapsLockToggle

"===========================
" Start Neobundle Settings.
"===========================
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif


"call neobundle#begin(expand('~/.vim/bundle/'))
call neobundle#begin()
if neobundle#load_cache()

  "neobundle自体をneobundleで管理
  NeoBundleFetch 'Shougo/neobundle.vim'

  "colorscheme
  NeoBundle 'altercation/vim-colors-solarized'

  "vimproc
  NeoBundle 'Shougo/vimproc.vim', {
        \ 'build' : {
        \     'windows' : 'tools\\update-dll-mingw',
        \     'cygwin' : 'make -f make_cygwin.mak',
        \     'mac' : 'make',
        \     'linux' : 'make',
        \     'unix' : 'gmake',
        \    },
        \ }

  " NERSTreeを設定
  NeoBundle 'scrooloose/nerdtree',{
        \ 'on_cmd':[
        \   'NERDTree',
        \]
        \ }

  NeoBundle 'Shougo/unite.vim'

  "autocloseプラグイン
  NeoBundle 'Townk/vim-autoclose'

  NeoBundle 'w0ng/vim-hybrid'
  NeoBundle 'nanotech/jellybeans.vim'

  "quickrunプラグイン
  NeoBundle 'thinca/vim-quickrun'

  "STL色付け
  NeoBundle 'Mizuchi/STL-Syntax',{
        \ 'on_ft' : ['cpp'],
        \}
  NeoBundle 'octol/vim-cpp-enhanced-highlight' , {
        \ 'on_ft' : ['cpp'],
        \}

  "STL色付け2
  NeoBundle 'vim-jp/cpp-vim' , {
        \ 'on_ft' : ['cpp'],
        \}

  "補完
  NeoBundle 'Shougo/neocomplete.vim'

  "Haskellインデントプラグイン
  NeoBundle 'dag/vim2hs' , {
        \ 'on_ft' : ['haskell'],
        \}

  "Haskell 補完
  NeoBundle 'ujihisa/neco-ghc' , {
        \ 'on_ft' : ['haskell'],
        \}

  " lisp系言語の括弧を色付け
  NeoBundle 'losingkeys/vim-niji'

  "lightline
  NeoBundle 'itchyny/lightline.vim'

  "NeoBundle 'thinca/vim-splash'

  NeoBundle 'limadm/vim-blues'

  " CapsLock
  NeoBundle 'tpope/vim-capslock' , {
        \ 'on_ft' : [ 'asm' ],
        \}


  NeoBundle 'chakku000/OpenTemplate.vim'


  NeoBundle 'whatyouhide/vim-gotham'
endif
call neobundle#end()
filetype plugin indent on
syntax enable
NeoBundleCheck

"========================
" End Neobundle Settings.
"========================

"====================
" plugin setting
"====================

"lightlingの設定
if neobundle#tap('lightline.vim')
  let g:lightline={
        \'colorscheme':'wombat'
        \}
endif

"neocomplete
if neobundle#tap('neocomplete.vim')
  "necomplete開始
  let g:neocomplete#enable_at_startup=1
  "大文字が入力されるまで大文字小文字を区別しない
  let g:neocomplete#enable_smart_case=1
  "日本語を補完しない
  "なんかこれしたらうごかなくなる
  "let g:neocomplete#lock_iminsert=1

  "<TAB>: completion
  inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
  "<C-h>,<BS>:close popup and deletebackword char
  inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
  inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
  "diision by Enter
  inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<CR>"
endif

"OpenTemplateの設定
if neobundle#tap('OpenTemplate.vim')
  let g:OpenTemplate#Template_dir = '~/Template'
endif
