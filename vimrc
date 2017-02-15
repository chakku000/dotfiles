set number	"行数表示
set list	"改行可視化
set listchars=tab:>-,extends:_,precedes:_,nbsp:%,eol:$

if &compatible
	set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/



call neobundle#begin(expand('~/.vim/bundle'))
if neobundle#load_cache()
	" Required:
	NeoBundleFetch 'Shougo/neobundle.vim'


"---- インストールするプラグイン

    NeoBundle 'Shougo/vimproc.vim', {
                \ 'build' : {
                \     'windows' : 'tools\\update-dll-mingw',
                \     'cygwin' : 'make -f make_cygwin.mak',
                \     'mac' : 'make',
                \     'linux' : 'make',
                \     'unix' : 'gmake',
                \    },
                \ }

	"COLOR SCHEME
	NeoBundle 'ciaranm/inkpot'

	"lightline
	NeoBundle 'itchyny/lightline.vim'


endif
call neobundle#end()
filetype plugin indent on
syntax enable
NeoBundleCheck

colorscheme inkpot
