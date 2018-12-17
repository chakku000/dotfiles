" C,C++
autocmd Filetype c,cpp setlocal cindent
autocmd FileType cpp setlocal makeprg=g++\ -std=c++14\ %

" Java
autocmd Filetype java let java_highlight_all = 1
"autocmd Filetype java highlight javaC_JavaLang guifg=#8abeb7


" Asciidoc
autocmd FileType asciidoc setlocal spell

" ANTLR
au BufRead,BufNewFile *.g set filetype=antlr3
au BufRead,BufNewFile *.g4 set filetype=antlr4

" Tex
let g:tex_flavor='latex'
