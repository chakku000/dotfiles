"分割した設定ファイルをすべて読み込む
"set runtimepath+=~/.vim/
"runtime! userautoload/*.vim

"=======================
"User Setting(色関係)
"=======================
syntax enable
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
set expandtab
set smarttab
set tabstop=4
set shiftwidth=4

"===============
" 可視化
"===============
set list    "改行可視化
set listchars=tab:>-,trail:-,extends:▷,precedes:◁,nbsp:%

"====================
" 括弧
"====================
set showmatch
set matchtime=1

"===================
"検索
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

"--------------------------
" Start Neobundle Settings.
"---------------------------
if has('vim_starting')
    if &compatible
        set compatible
    endif
    set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

"neobundle自体をneobundleで管理
NeoBundleFetch 'Shougo/neobundle.vim'

"colorscheme
NeoBundle 'altercation/vim-colors-solarized'

"vimproc
NeoBundle 'Shougo/vimproc',{
    \ 'build' : {
    \       'unix' : 'make -f make_unix.mak',
    \   },
    \ }

" NERSTreeを設定
NeoBundle 'scrooloose/nerdtree'

"autocloseプラグイン
NeoBundle 'Townk/vim-autoclose'

NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'nanotech/jellybeans.vim'

"quickrunプラグイン
NeoBundle 'thinca/vim-quickrun'

"STL色付け
NeoBundle 'Mizuchi/STL-Syntax'
NeoBundle 'octol/vim-cpp-enhanced-highlight'

"STL色付け2
NeoBundle 'vim-jp/cpp-vim'

"補完
NeoBundle 'Shougo/neocomplete.vim'

"Haskellインデントプラグイン
NeoBundle 'dag/vim2hs'

"Haskell 補完
NeoBundle 'ujihisa/neco-ghc'
"
NeoBundle 'losingkeys/vim-niji'


NeoBundle 'thinca/vim-splash'

NeoBundle 'chakku000/OpenTemplate.vim'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

"-------------------------
" End Neobundle Settings.
"-------------------------
