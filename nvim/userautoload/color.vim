"let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors


" カラースキームがhybridの際に括弧の対応色を変える
autocmd ColorScheme hybrid highlight MatchParen ctermbg=None guibg=None guifg=cyan
autocmd ColorScheme hybrid highlight javaC_JavaLang guifg=#8abeb7

autocmd ColorScheme hybrid highlight Search guibg=#5f875f

set background=dark
colorscheme hybrid 

" 補完ウィンドウの色
"highlight Pmenu ctermbg=Red
