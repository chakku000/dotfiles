"ファイルローカルな変数と関数を作成
"let s:mytex_dictionary = [
"            \"\\documentclass{jsarticle}",
"            \"\\begin{document}"
"            \]

let s:mytex_dictionary = readfile(expand("~/.config/nvim/userfile/MyTex/temp.tex"))

function! s:OpenTex(lst)
    let l:poi = 1
    for str in a:lst
        call setline(l:poi,str)
        let l:poi += 1
    endfor
endfunction

function! s:CompileTex()
    :w
    :! latexmk %
endfunction


"実行コマンド
command! OpenMyTex :call s:OpenTex(s:mytex_dictionary)

command! W :call s:CompileTex()

nmap <F5> :W<CR>
