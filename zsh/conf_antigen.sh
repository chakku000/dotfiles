antigen use oh-my-zsh

# zsh-users/zsh-autosuggestions: 履歴から自動補完
antigen bundle zsh-users/zsh-autosuggestions

# jeffreytse/zsh-vi-mode: vim-mode
antigen bundle jeffreytse/zsh-vi-mode

# zsh-vi-modeの後にキーバインドを設定
function zvm_after_init() {
  bindkey '^e' autosuggest-accept # ctrl-eで補完
}

# zdharma-continuum/fast-syntax-highlighting: コマンドに色を付ける
# (syntax highlightingは最後に読み込む)
antigen bundle zdharma-continuum/fast-syntax-highlighting

antigen theme romkatv/powerlevel10k

antigen apply
