"scheme用の設定
"autocmd FileType scheme inoremap <buffer><Tab> <C-o>==
autocmd FileType scheme setlocal expandtab shiftwidth=2
autocmd FileType scheme let b:AutoClosePairs = AutoClose#DefaultPairsModified("", "'")
