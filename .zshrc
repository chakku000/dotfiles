#マニュアル man zshmoduloes
#autoload -U : -Uオプションをつけるとユーザーのaliasによってその関数が書き換えられるのを防ぐ

autoload -U compinit
compinit

export LANG=ja_JP.UTF-8

bindkey -v

#色を使用できるようにする
autoload -Uz colors
colors

#----------------
#適当に追加した設定
#----------------
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

alias g++11="g++ -std=c++11"
alias g++="g++ -std=c++11"
alias tmux='tmux -2'
alias gosh='rlwrap gosh'
alias emacs='vim'
alias filer='nemo &'
alias sl='ls'
alias -- ++='g++ -std=c++14'
if [ -e "$HOME/App/bs/col.sh" ]; then
    alias colortest="bash $HOME/App/bs/col.sh"
fi


#アセンブラ用
alias asgcc='gcc -S -m32 -O0 -fno-asynchronous-unwind-tables'


xkbcomp -I$HOME/.xkb $HOME/.xkb/keymap/mykbd $DISPLAY 2> /dev/null

#export http_proxy="http://131.112.125.238:3128"
export XDG_CONFIG_HOME=$HOME/.config
export TERM=xterm-256color
export PATH="$HOME/Library/Haskell/bin:$PATH"

#for linux brew
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

#----------------------------


#cd したら自動的にpushdする
setopt auto_pushd
setopt pushd_ignore_dups
#ディレクトリ名だけでcdする
setopt auto_cd
function chpwd(){
    ls -F --color=auto
}
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
#PROMPT="%{${fg[green]}%}[%n@%m]%{${fg[green]}%}%~%#%{${reset_color}%} "
PROMPT="%{[38;5;048m%}[%n@%m]%{[38;5;086m%}%~%#%{${reset_color}%} "


#lsで色をつける
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=33;44:so=32:pi=33:ex=35:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:' list=colors 'di=34' 'ln=33' 'ex=35'

#COLOR_LIST
# 文字色        背景色
# 30 黒         40 黒
# 31 赤         41 赤
# 32 緑         42 緑
# 33 黄         43 黃
# 34 青         44 青
# 35 紫         45 紫
# 36 水色       46 水
# 37 白         47 白

#vsc_info(version control system)
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:*' formats '[%b]'
precmd () {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
RPROMPT="%1(v|%F{magenta}%1v%f|)"

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
