syntax enable
set number
set clipboard=unnamed,unnamedplus
colorscheme hybrid
set background=dark
"括弧の色を変える
hi MatchParen ctermbg=3

"カーソルを煙滅させない
set guicursor=a:blinkon0
set matchtime=0

"括弧の対応の色
hi MatchParen term=standout ctermbg=Blue ctermfg=white guibg=Red guifg=Black 
"対応する括弧のハイライトを表示しない
"let loaded_matchparen = 1

"=======================
"     NeoBundle
"======================

set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.config/nvim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

"completion"{{{
NeoBundle 'Shougo/deoplete.nvim'
let g:deoplete#enable_at_startup=1      "use deoplete
let g:deoplete#eneble_smart_case=1      "smart case
"next completion by tab
inoremap <expr><TAB> pumvisible() ? "\<C-N>" : "\<TAB>"
"close popup and delete backword char
inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  deoplete#mappings#smart_close_popup()."\<C-h>"
"dicision by Enter
inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<CR>"
"}}}

"useful{{
NeoBundle 'thinca/vim-quickrun'
let g:quickrun_config = {}
"}}

"autoclose{{
NeoBundle 'Townk/vim-autoclose'
inoremap {<Enter> {}<Left><CR><ESC><S-o>
autocmd Filetype scheme let b:AutoClosePairs = AutoClose#DefaultPairsModified("","'")

"}}

"scheme {{
NeoBundle 'losingkeys/vim-niji'
"}}

"colorscheme {{
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'Mizuchi/STL-Syntax'
"}}

"tex"{{{
augroup MyTex
    autocmd!
    autocmd Filetype plaintex source ~/.config/nvim/userfile/MyTex/MyTex.vim
    autocmd Filetype plaintex setlocal wrap
    autocmd Filetype tex source ~/.config/nvim/userfile/MyTex/MyTex.vim
    autocmd Filetype tex setlocal wrap
    autocmd Filetype plaintex setlocal foldmethod=marker
    autocmd Filetype tex setlocal foldmethod=marker
augroup END
"}}}
"markdown{{
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
au BufRead,BufNewFile *.md set filetype=markdown
"let g:previm_open_cmd = 'open -a Firefox'
let g:previm_show_header=0		"この値が0だとプレビュー時にヘッダに情報を表示すしない。1だと表示する
"}}

" else{{
NeoBundle 'itchyny/lightline.vim'
"}}

call neobundle#end()
NeoBundleCheck

"-------------------------------------
"   End NeoBundle
"-------------------------------------
filetype plugin indent on


set title

set nowrap                              "範囲外に出た時に折り返さない


"tab indent{{"{{{
set expandtab				"tabを押した時に半角スペースが挿入される
set tabstop=4                          "ファイル中の<tab>文字を画面上で見た目の何文字に展開する?
set shiftwidth=4                       "インデントを挿入するときに画面上で何文字に相当するか?
set softtabstop=4                      "tabキーを押した時に挿入される空白の量
set autoindent                         "改行時に前の行のインデントを継続する
set smartindent                        "改行時に入力された行の末尾に合わせて次の行のインデントを増減する

autocmd Filetype c setlocal cindent
autocmd Filetype cpp setlocal cindent
"}}"}}}
"
"assembly"{{{
autocmd Filetype asm setlocal tabstop=2 shiftwidth=2 softtabstop=2
"}}}

"vim"{{{
autocmd Filetype vim setlocal foldmethod=marker
"}}}

set ttimeout
"set timeout
set ttimeoutlen=0
"set timeoutlen=750

set cursorline

"不可視を可視化{{
set list
set listchars=tab:»_,trail:_,eol:$,extends:»,precedes:«,nbsp:%
"}

"my key mapping{{
inoremap <S-TAB> <Esc>lli
nnoremap <S-TAB> <S-a>
tnoremap <C-n> <C-\><C-n>
"}}
