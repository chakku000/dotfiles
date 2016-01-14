hi Comment ctermfg=LightRed
"colorscheme jellybeans
colorscheme hybrid
"set background=dark
"let g:seiya_auto_enable=1

"highlight Normal ctermbg=none
"highlight LineNumber ctermbg=none
"set cursorline
highlight CurlsorLine cterm=underline ctermfg=red ctermbg=red
"highlight CurlsorLine gui=underline guifg=NONE guibg=Blue


"autocmd VimEnter,Colorscheme * highlight ~

"if !has('gui_running')
"    augroup seiya
"        autocmd!
"        autocmd VimEnter,ColorScheme * highlight Normal ctermbg=none
"        autocmd VimEnter,ColorScheme * highlight LineNr ctermbg=none
"        autocmd VimEnter,ColorScheme * highlight SignColumn ctermbg=none
"        autocmd VimEnter,ColorScheme * highlight VertSplit ctermbg=none
"        autocmd VimEnter,ColorScheme * highlight NonText ctermbg=none
"    augroup END
"endif
