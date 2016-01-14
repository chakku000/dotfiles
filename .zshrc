autoload -U compinit
compinit

export LANG=ja_JP.UTF-8

#色を使用できるようにする
autoload -Uz colors
colors

#----------------
#適当に追加した設定
#----------------
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

alias g++11="g++ -std=c++11"
alias tmux='tmux -2'
alias gosh='rlwrap gosh'
alias emacs='vim'
alias filer='nemo &'
alias sl='ls'



#アセンブラ用
alias asgcc='gcc -S -m32 -O0 -fno-asynchronous-unwind-tables'


xkbcomp -I$HOME/.xkb $HOME/.xkb/keymap/mykbd $DISPLAY 2> /dev/null

#export http_proxy="http://131.112.125.238:3128"
export XDG_CONFIG_HOME=$HOME/.config
export TERM=xterm-256color

#----------------------------


#cd したら自動的にpushdする
setopt auto_pushd
setopt pushd_ignore_dups
#ディレクトリ名だけでcdする
setopt auto_cd
#同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

#ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

#vim風キーバインド
#bindkey -v

PATH=$PATH:~/.cabal/bin

#日本語ファイル名表示可能にする
setopt print_eight_bit

#補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'


#プロンプト
#1行表示
#PROMPT="%~$#"
#2行表示
PROMPT="%{${fg[cyan]}%}[%n@%m]%{${fg[cyan]}%}%~%#%{${reset_color}%} "

#lsで色をつける
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=35:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

########################################
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
#        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        #Linux用の設定
        alias ls='ls -F --color=auto'
        ;;
esac
 
# vim:set ft=zsh:
