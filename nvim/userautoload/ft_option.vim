" C,C++
autocmd Filetype c,cpp setlocal cindent
autocmd FileType cpp setlocal makeprg=g++\ -std=c++14\ %

" Java
autocmd Filetype java let java_highlight_all = 1
"autocmd Filetype java highlight javaC_JavaLang guifg=#8abeb7

" Haskell
autocmd Filetype haskell setlocal shiftwidth=2 tabstop=2        " 1 tab == 2 spaces

" python
" softtabstop=4 : <TAB>が4個のスペースのように振る舞う
" shiftwidth=4 : 自動インデント時に4幅
autocmd FileType python setlocal noexpandtab
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType python highlight SpellBad gui=underline guibg=#902020 guisp=Red

" Tex
let g:tex_flavor = "latex"
