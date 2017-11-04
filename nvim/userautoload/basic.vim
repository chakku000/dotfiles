"========file encoding===========
set encoding=utf-8
set ambiwidth=double

"==========View========================================
set number          " 行番号表示
set relativenumber  " 行番号を相対表示
set list            " タブ文字を^Iで表示,行末に$を表示
set listchars=tab:>_,trail:_,eol:$,extends:»,precedes:«,nbsp:%      " タブ(^I):>_,, 行末:$
set laststatus=2    " ステータスラインを常に表示
set cmdheight=2     " ステータスラインを2行
set noshowcmd       " 入力中のコマンドを非表示
set title           " タイトルを表示
set cursorline      " 現在行を可視化

set synmaxcol=500   " 500文字を超えたらhighlight off

"set guicursor=a:blinkon0
set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

"====time======
set ttimeout
"set timeoutlen=0

"===copy and paste====
set clipboard=unnamed,unnamedplus


"===tab edit========
set expandtab           " tabキーで半角スペースが挿入される
set smarttab            " 行頭でtabキーを入力するとshiftwidthの数だけインデントされる
set tabstop=4           " ファイル中の^I文字をスペース4文字分で表示させる
set shiftwidth=4        " インデントを挿入するときに4このスペースを入れる
set softtabstop=4       " tabキーを押した時
set shiftround          " インデントをshiftwidthの倍数にする
set autoindent
set smartindent
set breakindent         " 折りたたみ時にインデントを考慮

set backspace=indent,eol,start      " インデントと改行をbackspaceで消せるようにする

set foldmethod=marker
set modeline

"===== Search =====
set ignorecase          " 大文字と小文字を区別しない
set smartcase           " 検索に大文字が含まれていた場合ignorecaseを上書きする

set incsearch           " 検索コマンドを入力中にも入力中の部分を検索表示する
set hlsearch            " 検索結果をハイライトする
set wrapscan            " 検索をファイル末尾までしたらファイル先頭に戻る

"===== Mouse =====
set mouse=


let g:python3_host_prog = '/usr/bin/python3'

"===== autocmd =====
autocmd QuickFixCmdPost make copen
