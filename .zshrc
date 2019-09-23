#マニュアル man zshmoduloes
# autoload : シェル関数を$fpathからロード(実行するわけではない)
# autoload -U : ロードされる関数内でaliasを展開しない

# 補完の初期化
# compinit : 補完に必要な機能をロード(機能を全て有効にするわけではない?)
autoload -U compinit
compinit

export LANG=ja_JP.UTF-8

bindkey -v
bindkey '^R' history-incremental-search-backward

#色を使用できるようにする
autoload -Uz colors
colors

## .prefix
source ~/.profile

#----------------
#適当に追加した設定
#----------------
zstyle ':completion:*:default' menu select=1
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

alias g++11="g++ -std=c++11"
alias g++="g++ -std=c++14 -Wall"
#alias tmux='tmux -2'
#alias tmux="env TERM=xterm-256color tmux"

# miss typeing vim
 alias vi='nvim'
alias vim='nvim'
# alias nvi='nvim'
alias grep='grep --color=always'
alias gosh='rlwrap gosh'
alias python='python3'
alias py3='python3'
alias filer='nemo &'
alias sl='ls'
alias -- ++='g++ -std=c++14'

# This is required for IQ1
alias mv='mv -i'
alias cp='cp -i'

# Docker呼び出し
alias tex-docker='docker run --rm -it -v $PWD:/workdir docker-tex'
alias tex-ubuntu='docker run --rm -it -v $PWD:/work tex-ubuntu'

if [ -e "$HOME/App/bs/col.sh" ]; then
    alias colortest="bash $HOME/App/bs/col.sh"
fi


#アセンブラ用
alias asgcc='gcc -S -m32 -O0 -fno-asynchronous-unwind-tables'

ONI_NEOVIM_PATH=$HOME/.local/bin/nvim
export ONI_NEOVIM_PATH

xkbcomp -I$HOME/.xkb $HOME/.xkb/keymap/mykbd $DISPLAY 2> /dev/null

#export http_proxy="http://131.112.125.238:3128"
export XDG_CONFIG_HOME=$HOME/.config
#export TERM=xterm-256color
export PATH="$HOME/Library/Haskell/bin:$PATH"

#for linux brew
export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

#export TEXMFLOCAL="$HOME/.tex"

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
#PROMPT="%{[38;5;048m%}[%n]%{[38;5;086m%}[%~% ]
#\$%{${reset_color}%} "
# $'\n' --> 改行文字
#PROMPT="%{${fg_bold[magenta]}%}[%n]%{${reset_color}% %{${fg_bold[yellow]}%}[%~]"$'\n'"%{${fg_bold[cyan]}%}(✿╹◡╹)ﾉ%{${reset_color}%} "
PROMPT="%{[38;5;212;1m%}[%n]%{[0m%} %{${fg_bold[yellow]}%}[%~]"$'\n'"%{${fg_bold[cyan]}%}(✿╹◡╹)ﾉ%{${reset_color}%} "


#lsで色をつける
export LSCOLORS=exfxcxdxbxegedabagacad
export LS_COLORS='di=01;34:ln=33;44:so=32:pi=33:ex=35:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:' list-colors ${(s.:.)LS_COLORS}

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
#export PATH="$HOME/.jenv/bin:$PATH"
#eval "$(jenv init -)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/chakku/.sdkman"
[[ -s "/home/chakku/.sdkman/bin/sdkman-init.sh" ]] && source "/home/chakku/.sdkman/bin/sdkman-init.sh"

## pyenv


# nvmの設定
## nvm.shの読み込みが非常に重く、シェルの起動が明らかに遅くなる
## 対応としてsource nvm.shを遅延させる

#### nvmコマンドを叩くとこのnvm関数が呼ばれる
nvm () {
    echo "NVM Command!!!"

    if [ -v NVM_SOURCED ]; then # すでにsourceされている場合
        echo "Already sourced"
    else    # sourceされていない場合
        echo "Not sourced"
        unset -f nvm
        source $HOME/.nvm/nvm.sh
    fi

    NVM_SOURCED=1
}
