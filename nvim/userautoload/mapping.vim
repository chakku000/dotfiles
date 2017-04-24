"折りたたみでの移動を見えてる行での移動にする
nnoremap j gj
nnoremap k gk

"Shift+Tabで右に移動(括弧の脱出用)
inoremap <S-Tab> <Esc>la
nnoremap <S-Tab> a

"ctrl-hでbackspace
inoremap <C-d> <DEL>
inoremap <C-l> <Right>

inoremap <C-t> <C-V><Tab>

" Insert modeで<C-@>は特別キーが割当ら得ており邪魔なので
inoremap <C-@> <C-]>

"terminal modeからの脱出
tnoremap <C-n> <C-\><C-n>

" :W でlatexmkを使用してtexをコンパイル
function! s:CompileTex()
    :w
    :! latexmk %
endfunction
autocmd Filetype tex command! W :call s:CompileTex() 
nmap <F5> :W<CR>

" <F1>でcursurcolumnの状態を反転
nnoremap <F2> :<C-u>setlocal cursorcolumn!<CR>
