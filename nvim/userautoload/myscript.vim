if exists('g:load_myscript')
    finish
endif

let g:load_myscript=1


"ファイル名を現在のバッファに追加するスクリプト+コマンド
function s:insertfilename() abort
    let s:filename=expand('%:r')
    execute "normal a" . s:filename
endfunction

command! InsertFilename call s:insertfilename()
