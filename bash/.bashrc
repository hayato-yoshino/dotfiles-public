# 前方一致の履歴補完
bind '"\C-n": history-search-forward'
bind '"\C-p": history-search-backward'

# fzf options
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --glob "!{.git,tmp,vendor,tags}" || true'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'
