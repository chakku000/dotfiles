" C,C++
autocmd Filetype c,cpp setlocal cindent
autocmd FileType cpp setlocal makeprg=g++\ -std=c++14\ %

" Java
autocmd Filetype java let java_highlight_all = 1
"autocmd Filetype java highlight javaC_JavaLang guifg=#8abeb7



" python
" softtabstop=4 : <TAB>が4個のスペースのように振る舞う
" shiftwidth=4 : 自動インデント時に4幅
autocmd FileType python setlocal noexpandtab
autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd FileType python highlight SpellBad gui=underline guibg=#902020 guisp=Red

" Asciidoc
autocmd FileType asciidoc setlocal spell

" ANTLR
au BufRead,BufNewFile *.g set filetype=antlr3
au BufRead,BufNewFile *.g4 set filetype=antlr4
