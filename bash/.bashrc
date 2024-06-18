# プロンプトの設定
# [Local.hayato-yoshino] <dir-name> $
PS1='[\[\e[1m\]Local.\[\e[0m\]hayato-yoshino] \W \$'

# 前方一致の履歴補完
bind '"\C-n": history-search-forward'
bind '"\C-p": history-search-backward'

# fzf options
# 最後の true は、rg がファイルを見つけられなかったときにエラーを返さないようにするため
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --glob "!{vendor/*,node_modules/*,.git/*,tmp/*,tags,.ruff_cache/*,**/__pycache__/*}" || true'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

export BUNDLER_EDITOR='nvim'
