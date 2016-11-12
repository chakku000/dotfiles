set runtimepath+=~/.config/nvim/
runtime! userautoload/*.vim
"runtime! userautoload/plug_option/*.vim

"if has('vim_starting')
"	let s:deindir=expand('~/.config/nvim/dein')
"	let s:deinlocal=s:deindir.'/repos/github.com/Shougo/dein.vim'
"	let &runtimepath = s:deinlocal . ',' . &runtimepath
"endif
"
"if dein#load_state(s:deindir)
"	call dein#begin(s:deindir)
"	call dein#add('Shougo/dein.vim')
"	call dein#add('Shougo/deoplete.nvim')
"	call dein#end()
"	call dein#save_state()
"endif
"
if dein#tap('deoplete.nvim')
	let g:deoplete#enable_at_startup = 1
endif
