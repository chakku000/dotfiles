source ~/.profile
source ~/.alias

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

# colors function: combine color name and ANSI standard 8 color terminal code
# black, red, gree, yellow, blue, magenta, cyan, white
# bold, faint, standout, underline, blink, reverse, conceal
#autoload -Uz colors
#colors


#----------------
# Style Setting
#----------------
# define `menu` style. usually return select=1
zstyle ':completion:*:default' menu select=1
# define `list-colors` style. always return ${(s.:.)LS_COLORS}
#zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

export XDG_CONFIG_HOME=$HOME/.config


#####################
# Optional Setting 
# See `man zshoptions`
#####################

# `setop <option_name>` enables the option
# `unsetopt` command disenables the option

#cd したら自動的にpushdする
setopt auto_pushd
setopt pushd_ignore_dups
#ディレクトリ名だけでcdする
setopt auto_cd
function chpwd(){
    ls -F -G
}
#同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# completion
setopt auto_menu    # By press tab key repeatedly, zsh selects the next completion candidate

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


####################
# Prompt Setting
####################
#color scheck
# for c in {000..255}; do echo -n "\e[38;5;${c}m $c"; [ $(($c%16)) -eq 15 ] && echo; done; echo
PROMPT="%K{093}%F{015}%B[%n@%m]%b%f%k%K{021}%F{015}%B[%~]%b%f%k
%F{208}(✿╹◡╹)ﾉ%f "


# coloring `ls` output
# LSCOLORS is for BSD (and MacOS)
# LS_COLORS is for GNU
export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

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

##############################
#            Zinit           #
##############################
### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zinit-zsh/z-a-rust \
    zinit-zsh/z-a-as-monitor \
    zinit-zsh/z-a-patch-dl \
    zinit-zsh/z-a-bin-gem-node

### End of Zinit's installer chunk

##############################
#         zsh plugins        #
##############################
zinit light zsh-users/zsh-autosuggestions
bindkey '^e' autosuggest-accept
#zinit load zdharma/history-search-multi-word

zinit light zsh-users/zsh-syntax-highlighting
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[path]=none
ZSH_HIGHLIGHT_STYLES[path_prefix]=none



##############################
#            fzf             #
##############################
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
