set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

"---------- dein.vimでプラグイン管理 -----------------
call dein#begin(expand('~/.config/nvim/dein'))

"dein.vim自体を管理
call dein#add('Shougo/dein.vim')

call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/denite.nvim')
call dein#add('Shougo/defx.nvim')

call dein#add('cohama/lexima.vim')

" Snippet
call dein#add('Shougo/neosnippet.vim',{
            \ 'on_ft' : [
            \   'tex',
            \   ],
            \})


call dein#add('Shougo/neosnippet-snippets',{
            \ 'on_ft' : [
            \   'tex',
            \   ],
            \})

"filer
call dein#add('scrooloose/nerdtree')

"surround
call dein#add('tpope/vim-surround')

""----- C++ ------
call dein#add('octol/vim-cpp-enhanced-highlight',{
            \ 'on_ft':[
            \    'c','cpp',
            \   ],
            \ })
call dein#add('Mizuchi/STL-Syntax',{
            \ 'on_ft' : [
            \   'c','cpp',
            \   ],
            \})

call dein#add('vim-jp/cpp-vim',{
            \ 'on_ft' : [
            \   'cpp',
            \],
            \})

"----- Haskell -----
""""" Unused
"call dein#add('neovimhaskell/haskell-vim',{
"            \ 'on_ft' : ['haskell',],
"            \})

call dein#add('dag/vim2hs',{
            \ 'on_ft' : ['haskell',],
            \}) 

call dein#add('eagletmt/neco-ghc',{
            \ 'on_ft' : ['haskell',],
            \})

"----- Scala -----
call dein#add('derekwyatt/vim-scala',{
            \ 'on_ft' : ['scala',],
            \})

"----- Python ----
call dein#add('scrooloose/syntastic',{
            \ 'on_ft' : ['python'],
            \})
call dein#add('davidhalter/jedi-vim',{
            \ 'on_ft' : ['python'],
            \})

"----- HTML ----
call dein#add('othree/html5.vim',{
            \ 'on_ft' : ['html',],
            \})
call dein#add('mattn/emmet-vim',{
            \ 'on_ft' : ['html',],
            \})

"---colorscheme----
call dein#add('nanotech/jellybeans.vim')
call dein#add('w0ng/vim-hybrid')
call dein#add('cocopon/iceberg.vim')
"
call dein#add('itchyny/lightline.vim')
"
"---- git ----
call dein#add('lambdalisue/gina.vim')

"---- execution ----
call dein#add('thinca/vim-quickrun')

"---- ANTLR
call dein#add('dylon/vim-antlr')

"---- Ocaml
if executable('opam')
    call dein#add('$HOME/.opam/4.07.0/share/merlin/vim',{
                \ 'on_ft' : ['ocaml'],
                \})
    call dein#add('copy/deoplete-ocaml',{
                \'on_ft' : ['ocaml'],
                \})
endif

"-- My Plugin -----
call dein#add('chakku000/OpenTemplate.vim')

"--- Local Plugin ----
"call dein#local("~/Programing/Vimscript/Plugins")

call dein#end()

"----未インストールのプラグインを確認---
if dein#check_install()
   call dein#install()
endif



function! s:dein_list() abort
  echomsg '[dein] #: not sourced, X: not installed'
  for pair in items(dein#get())
    echomsg (!isdirectory(pair[1].path) ? 'X'
          \ : pair[1].sourced ? ' '
          \ : '#') pair[0]
  endfor
endfunction
command! DeinList call s:dein_list()


"-------------プラグインの設定----------------
" deoplete
if dein#tap('deoplete.nvim')
	let g:deoplete#enable_at_startup=1
    "<TAB>: completion.  (copy from Shougo's github)
    inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
    "inoremap <silent><expr> <TAB>
    "            \ pumvisible() ? "\<C-n>" :
    "            \ <SID>check_back_space() ? "\<TAB>" :
    "            \ deoplete#manual_complete()
    function! s:check_back_space() abort "{{{
        let col = col('.') - 1
        return !col || getline('.')[col - 1]  =~ '\s'
    endfunction"}}}
endif

" denite
if dein#tap('denite.nvim')
    " カレントディレクトリ
    nnoremap <C-C> :Denite file<CR>
    call denite#custom#map('insert','<C-s>','<denite:do_action:split>','noremap')
    call denite#custom#map('insert','<C-v>','<denite:do_action:vsplit>','noremap')
    call denite#custom#map('insert','<C-t>','<denite:do_action:tabopen>','noremap')
endif

" lexima
if dein#tap('lexima.vim')
"    let g:lexima_enable_basic_rules=1
    "|)では括弧を保管しない
    "call lexima#add_rule({'char' : '(' , 'input':'(','at':'\%#)'})
    " コメント内では括弧を保管しない
    call lexima#add_rule({'char' : '(' , 'input' : '(' , 'syntax' : 'Comment'})
    " 文字列内では補完しない
    call lexima#add_rule({'char' : '(' , 'input' : '(' , 'syntax' : 'String'})
endif

" lightline
if dein#tap('lightline.vim')
	let g:lightline = {
		\'colorscheme' : 'iceberg',
		\}
endif

if dein#tap('OpenTemplate.vim')
    let g:OpenTemplate#Template_dir = '~/Template'
endif

" NerdTree
if dein#tap('nerdtree')
    let s:file_name=expand('%')
"    if has('vim_starting') &&  s:file_name == ''
"        autocmd VimEnter * NERDTree ./
"    endif
endif

"vim2hs
if dein#tap('vim2hs')
    let g:haskell_conceal = 0
endif


"emmet-vim
if dein#tap('emmet-vim')
    let g:user_emmet_leader_key='<c-e>'
endif

if dein#tap('iceberg.vim')
    colorscheme iceberg
endif

if dein#tap('vim-quickrun')
    let g:quickrun_config = {}
    let g:quickrun_config.c = {
                \   "command" : "gcc",
                \   "cmdopt" : "-pthread"
                \}
endif

if dein#tap('syntastic')
    let g:syntastic_python_checkers = ['pyflakes', 'pep8']
endif

if dein#tap('vim-cpp-enhanced-highlight')
    "let g:cpp_experimental_simple_template_highlight = 1
    let g:cpp_class_scope_highlight = 1
endif


if dein#tap('neosnippet.vim')
    function! s:neosnippet_on_source()
        imap <C-k>     <Plug>(neosnippet_expand_or_jump)
        smap <C-k>     <Plug>(neosnippet_expand_or_jump)
        xmap <C-k>     <Plug>(neosnippet_expand_target)
    endfunction
    call dein#set_hook(g:dein#plugin['name'],'hook_source',function('s:neosnippet_on_source'))
endif

if dein#tap('defx.nvim')
    autocmd FileType defx call s:defx_my_settings()
    function! s:defx_my_settings() abort
        " Define mappings
        nnoremap <silent><buffer><expr> <CR>
                    \ defx#do_action('open')
        nnoremap <silent><buffer><expr> c
                    \ defx#do_action('copy')
        nnoremap <silent><buffer><expr> m
                    \ defx#do_action('move')
        nnoremap <silent><buffer><expr> p
                    \ defx#do_action('paste')
        nnoremap <silent><buffer><expr> l
                    \ defx#do_action('open')
        nnoremap <silent><buffer><expr> E
                    \ defx#do_action('open', 'vsplit')
        nnoremap <silent><buffer><expr> P
                    \ defx#do_action('open', 'pedit')
        nnoremap <silent><buffer><expr> K
                    \ defx#do_action('new_directory')
        nnoremap <silent><buffer><expr> N
                    \ defx#do_action('new_file')
        nnoremap <silent><buffer><expr> d
                    \ defx#do_action('remove')
        nnoremap <silent><buffer><expr> r
                    \ defx#do_action('rename')
        nnoremap <silent><buffer><expr> x
                    \ defx#do_action('execute_system')
        nnoremap <silent><buffer><expr> yy
                    \ defx#do_action('yank_path')
        nnoremap <silent><buffer><expr> .
                    \ defx#do_action('toggle_ignored_files')
        nnoremap <silent><buffer><expr> h
                    \ defx#do_action('cd', ['..'])
        nnoremap <silent><buffer><expr> ~
                    \ defx#do_action('cd')
        nnoremap <silent><buffer><expr> q
                    \ defx#do_action('quit')
        nnoremap <silent><buffer><expr> <Space>
                    \ defx#do_action('toggle_select') . 'j'
        nnoremap <silent><buffer><expr> *
                    \ defx#do_action('toggle_select_all')
        nnoremap <silent><buffer><expr> j
                    \ line('.') == line('$') ? 'gg' : 'j'
        nnoremap <silent><buffer><expr> k
                    \ line('.') == 1 ? 'G' : 'k'
        nnoremap <silent><buffer><expr> <C-l>
                    \ defx#do_action('redraw')
        nnoremap <silent><buffer><expr> <C-g>
                    \ defx#do_action('print')
    endfunction
endif
