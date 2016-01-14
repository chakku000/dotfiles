set runtimepath+=~/.vim/
runtime! userautoload/*.vim

set nocompatible
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    call neobundle#begin(expand('~/.vim/bundle/'))
endif

NeoBundleFetch 'Shougo/neobundle.vim'      "NeoBundleをNeoBundleで管理する
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/vimproc', {
                    \       'build':{
                    \           'unix':'make -f make_unix.mak',
                    \       },
                    \ }

NeoBundle 'Shougo/neocomplete.vim'
"NeoBundle 'Shougo/neoinclude.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'

NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'Townk/vim-autoclose'
NeoBundle 'w0ng/vim-hybrid'
"scheme
NeoBundle 'losingkeys/vim-niji'
"html/css
NeoBundleLazy 'mattn/emmet-vim',{
    \   'autoload' : {"filetypes":["html"]}
\}



NeoBundle 'itchyny/lightline.vim'

let g:lightline = {
        \ 'colorscheme' : 'wombat',
   \ }

"C++
NeoBundle 'Mizuchi/STL-Syntax'
"NeoBundle 'osyo-manga/vim-reunions'
"NeoBundle 'osyo-manga/vim-marching'

"Haskell
"NeoBundle 'dag/vim2hs'
NeoBundleLazy 'ujihisa/neco-ghc',{
    \ "autoload":   {"filetypes":["haskell"]}
\}

"背景透明化
NeoBundle 'miyakogi/seiya.vim'


call neobundle#end()
NeoBundleCheck
filetype plugin indent on

"-----------------------
"-----neocomplete-------
"-----------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 4
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"


" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
"if !exists('g:neocomplete#sources#omni#input_patterns')
"  let g:neocomplete#sources#omni#input_patterns = {}
"endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
"let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'










"--------------------------------------------------

"set nocompatible        "vi互換無効
"filetype off
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

set mouse=n

"set nowrap

"clipboardの設定
set clipboard=unnamed,unnamedplus
"set clipboard+=unnamedplus

"補完関連
"set completeopt=menuone     "表示方法

"set hlsearch
"set ignorecase
"set smartcase

"set nofoldenable        "畳み込みの無効化

set autoindent
set smartindent

"set cursorline

"set ruler
set number
"set list
"set wildmenu
"set showcmd
set shiftwidth=4
set softtabstop=4
set expandtab
set smarttab

autocmd FileType haskell setlocal expandtab softtabstop=2 shiftwidth=2 tabstop=2
autocmd FileType scheme setlocal expandtab softtabstop=2 shiftwidth=2 tabstop=2 autoindent smartindent
autocmd FileType python setlocal expandtab softtabstop=4 shiftwidth=4 tabstop=4

"改行してインデント
inoremap {<Enter> {}<Left><CR><ESC><S-o>

"shift+tabで左移動
inoremap <S-TAB> <Esc>lli
nnoremap <S-TAB> <S-a>
hi Comment ctermfg=LightRed
autocmd Filetype cpp setlocal cindent
autocmd Filetype c setlocal cindent
autocmd Filetype cpp setlocal path+=/usr/include/c++/4.9
"colorscheme jellybeans
"set nocursorline

set background=dark


set laststatus=2
