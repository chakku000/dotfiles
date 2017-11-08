set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

"---------- dein.vimでプラグイン管理 -----------------
call dein#begin(expand('~/.config/nvim/dein'))

"dein.vim自体を管理
call dein#add('Shougo/dein.vim')

call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/denite.nvim')

call dein#add('cohama/lexima.vim')

" filer
call dein#add('scrooloose/nerdtree')

" surround
call dein#add('tpope/vim-surround')

"----- C++ ------
call dein#add('octol/vim-cpp-enhanced-highlight',{
        \ 'on_ft':[
        \    'cpp',
        \   ],
        \ })

"----- Haskell -----
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

call dein#add('itchyny/lightline.vim')

"---- git ----
call dein#add('lambdalisue/gina.vim')

"-- My Plugin -----
call dein#add('chakku000/OpenTemplate.vim')

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
		\'colorscheme' : 'poi',
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
