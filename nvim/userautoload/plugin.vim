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

"----- C++ ------
call dein#add('octol/vim-cpp-enhanced-highlight',{
        \ 'on_ft':[
        \    'cpp',
        \   ],
        \ })

"----- Haskell -----
call dein#add('neovimhaskell/haskell-vim',{
            \ 'on_ft' : ['haskell',],
            \})

call dein#add('eagletmt/neco-ghc',{
            \ 'on_ft' : ['haskell',],
            \})

"---colorscheme----
call dein#add('nanotech/jellybeans.vim')
call dein#add('w0ng/vim-hybrid')

call dein#add('itchyny/lightline.vim')

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
"    inoremap <silent><expr> <TAB>
"                \ pumvisible() ? "\<C-n>" :
"                \ <SID>check_back_space() ? "\<TAB>" :
"                \ deoplete#manual_complete()
"    function! s:check_back_space() abort "{{{
"        let col = col('.') - 1
"        return !col || getline('.')[col - 1]  =~ '\s'
"    endfunction"}}}
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> deoplete#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> deoplete#smart_close_popup()."\<C-h>"

    inoremap <expr><C-g> deoplete#undo_completion()
    " <C-l>: redraw candidates      -> conflict with my setting
    " inoremap <expr><C-l>       deoplete#refresh()

    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function() abort
        return deoplete#cancel_popup() . "\<CR>"
    endfunction

    inoremap <expr> '  pumvisible() ? deoplete#close_popup() : "'"
endif

" lexima
if dein#tap('lexima.vim')
"    let g:lexima_enable_basic_rules=1
endif

" lightline
if dein#tap('lightline.vim')
	let g:lightline = {
		\'colorscheme' : 'wombat',
		\}
endif

if dein#tap('OpenTemplate.vim')
    let g:OpenTemplate#Template_dir = '~/Template'
endif

" NerdTree
if dein#tap('nerdtree')
"    let s:file_name=expand('%')
"    if has('vim_starting') &&  s:file_name == ''
"        autocmd VimEnter * NERDTree ./
"    endif
endif
