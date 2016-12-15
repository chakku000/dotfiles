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

" カーソル下のhighlight情報を表示する
function! s:get_syn_id(transparent)
    let synid = synID(line('.'), col('.'), 1)
    return a:transparent ? synIDtrans(synid) : synid
endfunction
function! s:get_syn_name(synid)
    return synIDattr(a:synid, 'name')
endfunction
function! s:get_highlight_info()
    execute "highlight " . s:get_syn_name(s:get_syn_id(0))
    execute "highlight " . s:get_syn_name(s:get_syn_id(1))
endfunction
command! HighlightInfo call s:get_highlight_info()
