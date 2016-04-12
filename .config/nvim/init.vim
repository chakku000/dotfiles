"シンタックスハイライト有効化
syntax enable


"==================
"test
"=================

"=======================
"     NeoBundle
"======================

set runtimepath+=~/.config/nvim/bundle/neobundle.vim/
call neobundle#begin(expand('~/.config/nvim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

"completion{{{
NeoBundle 'Shougo/deoplete.nvim'
let g:deoplete#enable_at_startup=1      "use deoplete
let g:deoplete#enable_smart_case=1        "smart_case
"next completion by tab
inoremap <expr><TAB> pumvisible() ? "\<C-N>" : "\<TAB>"
"close popup and delete backword char
inoremap <expr><C-h> deoplete#mappings#smart_close_popup()."\<C-h>"
inoremap <expr><BS>  deoplete#mappings#smart_close_popup()."\<C-h>"
"dicision by Enter
inoremap <expr><CR> pumvisible() ? "\<C-y>" : "\<CR>"


"}}}

"compile{{{
NeoBundle 'thinca/vim-quickrun'
let g:quickrun_config = {}
"}}}

"filer"{{{
NeoBundle 'scrooloose/nerdtree'
""}}}

"autoclose{{{
NeoBundle 'Townk/vim-autoclose'
inoremap {<Enter> {}<Left><CR><ESC><S-o>
autocmd Filetype scheme let b:AutoClosePairs = AutoClose#DefaultPairsModified("","'")
"}}}

"cpp{{{
NeoBundleLazy 'octol/vim-cpp-enhanced-highlight' ,{
            \"autoload" : {"filetypes" : ["cpp"]}
            \}
"}}}

"scheme"{{{
NeoBundle 'losingkeys/vim-niji'
"}}}

"haskell{{{
NeoBundle 'kana/vim-filetype-haskell'
NeoBundle 'ujihisa/neco-ghc'
NeoBundle 'dag/vim2hs'
let g:haskell_conceal=0
"autocmd Filetype haskell setlocal tabstop=2
autocmd Filetype haskell setlocal noexpandtab
"}}}

"javascript"{{{
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
"}}}

"colorscheme {{{
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundleLazy 'Mizuchi/STL-Syntax',{
            \"autoload" : {"filetypes" : ["cpp"]}
            \}
"}}}

"tex{{{
augroup MyTex
    autocmd!
    autocmd Filetype plaintex source ~/.config/nvim/userfile/MyTex/MyTex.vim
    autocmd Filetype plaintex setlocal wrap
    autocmd Filetype tex source ~/.config/nvim/userfile/MyTex/MyTex.vim
    autocmd Filetype tex setlocal wrap
augroup END
"}}}

"markdown{{{
NeoBundleLazy 'plasticboy/vim-markdown',{
            \"autoload" : {"filetypes" : ["md","mkd"]}
            \}
NeoBundleLazy 'kannokanno/previm',{
            \"autoload" : {"filetypes" : ["md","mkd"]}
            \}
NeoBundleLazy 'tyru/open-browser.vim',{
            \"autoload" : {"filetypes" : ["md","mkd"]}
            \}
au BufRead,BufNewFile *.md set filetype=markdown
"let g:previm_open_cmd = 'open -a Firefox'
let g:previm_show_header=0      "この値が0だとプレビュー時にヘッダに情報を表示すしない。1だと表示する
"}}}

"HTML"{{{
NeoBundle 'othree/html5.vim'
""}}}

" else{{{
NeoBundle 'itchyny/lightline.vim'
"}}}

"java"{{{
let java_highlight_all = 1
let java_highlight_functions=1
let java_allow_cpp_keywords=1
"NeoBundleLazy 'artur-shaik/vim-javacomplete2',{
"            \"autoload" : {"filetypes" : ["java"]}
"            \}
"autocmd FileType java setlocal omnifunc=javacomplete#Complete
"autocmd FileType java let g:deoplete#auto_completion_start_length=4
"autocmd FileType java let g:deoplete#max_list=10
"let g:deoplete#omni_patterns = {}
"let g:deoplete#omni_patterns.java = ''
"let g:deoplete#omni#input_patterns = {}
"let g:deoplete#omni#input_patterns.java = ''
"let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'
"let g:deoplete#omni#input_patterns.java = '[^. *\t]\.\w*'

"}}}

"自作プラグイン
NeoBundle 'chakku000/OpenTemplate.vim'

"NeoBundle 'chakku000/OpenTemplate.vim',{
"            \ 'base' : '~/prog/VimPlugin',
"            \ 'type' : 'nosync',
"            \}

let g:OpenTemplate#Template_dir = '~/Template'

"vimscript
NeoBundleLazy 'mopp/layoutplugin.vim', { 'autoload' : { 'commands' : 'LayoutPlugin'} }
"

"indentline"{{{
"NeoBundle 'Yggdroot/indentLine'
"let g:indentLine_enabled=0
"let g:indentLine_fileType=['c' , 'cpp']
"let g:indentLine_faster=1
"let g:indentLine_color_term = 111
"let g:indentLine_color_gui = '#708090'
"let g:indentLine_char = '¦' "use ¦, ┆ or │
"nmap <silent><Leader>i :<C-u>IndentLinesToggle<CR>
""}}}

call neobundle#end()
NeoBundleCheck

"-------------------------------------
"   End NeoBundle
"-------------------------------------
filetype plugin indent on


set title

set nowrap                              "範囲外に出た時に折り返さない
set ignorecase                          "大文字と小文字を区別しない
set magic                               "正規表現magicモード
"正規表現very magicモード
nnoremap / /\v

"set scrolloff=5
set expandtab                          "tabを押した時に半角スペースが挿入される
set smarttab                           "行頭で<tab>を打ち込んだ場合(>>や<<)shiftwidthの数だけインデントされる
set tabstop=4                          "ファイル中の<tab>文字を画面上で見た目の何文字に展開する?
set shiftwidth=4                       "インデントを挿入するときに画面上で何文字に相当するか?
set softtabstop=4                      "tabキーを押した時に挿入される空白の量
set autoindent                         "改行時に前の行のインデントを継続する
set smartindent                        "改行時に入力された行の末尾に合わせて次の行のインデントを増減する

set foldmethod=marker
autocmd Filetype c setlocal cindent
autocmd Filetype cpp setlocal foldmethod=marker
autocmd Filetype cpp setlocal cindent
autocmd Filetype haskell setlocal foldmethod=marker
"}}

"行番号を表示
set number
"行番号を相対的に表示
set relativenumber
"Normal Mode <F3>で行番号の表示を絶対/相対で切り替える
nnoremap <F3> :<C-u>setlocal relativenumber!<CR>

set clipboard=unnamedplus

set ttimeout
set ttimeoutlen=0

"カーソルラインを有効化
set cursorline

"不可視を可視化{{
set list
set listchars=tab:»_,trail:_,eol:$,extends:»,precedes:«,nbsp:%
"}

"colorscheme hybrid
"set background=dark
colorscheme jellybeans
"括弧の色を変える
hi MatchParen ctermbg=3
"カーソルを煙滅させない
set guicursor=a:blinkon0
set matchtime=0

"括弧の対応の色
hi MatchParen term=standout ctermbg=Blue ctermfg=white guibg=Red guifg=Black 
"対応する括弧のハイライトを表示しない
"let loaded_matchparen = 1
"my key mapping{{
inoremap <S-TAB> <Esc>lli
nnoremap <S-TAB> <S-a>
tnoremap <C-n> <C-\><C-n>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <Left> <C-w>h
nnoremap <Down> <C-w>j
nnoremap <Up> <C-w>k
nnoremap <Right> <C-w>l

"terminal mode
"tnoremap <Esc> <C-\><C-n>

autocmd FileType python setlocal noexpandtab tabstop=4 shiftwidth=4


"==============
"  HTML
"==============
autocmd FileType html setlocal nocindent nosmartindent

"==============
" CSS
" =============
autocmd Filetype css setlocal nocindent nosmartindent

"==============
" Verilog
"==============
autocmd FileType verilog let b:verilog_indent_modules=1
autocmd FileType verilog setlocal nosmartindent

"}}

"{{{     独自関数定義

"行末のスペースを除去する関数
function! DeleteExtraSpace() abort
    :%s/\v\s+$//g
endfunction

command! DeleteExtraSpace :call DeleteExtraSpace()

"}}}
