# プロンプトの設定
if [ -f ~/.config/git/git-completion.sh ]; then
    source ~/.config/git/git-completion.sh
fi
if [ -f ~/.config/git/git-prompt.sh ]; then
    source ~/.config/git/git-prompt.sh
fi

GIT_PS1_SHOWDIRTYSTATE=true

if [ -f ~/.config/git/git-completion.sh ] && [ -f ~/.config/git/git-prompt.sh ]; then
    PS1='[\[\e[38;2;192;208;136m\]Local\[\e[0m\]] \W\[\e[38;2;94;129;172m\]$(__git_ps1)\[\e[0m\] \$'
else
    PS1='[\[\e[38;2;192;208;136m\]Local\[\e[0m\]] \W \$'
fi

# 前方一致の履歴補完
bind '"\C-n": history-search-forward'
bind '"\C-p": history-search-backward'

# fzf options
# 最後の true は、rg がファイルを見つけられなかったときにエラーを返さないようにするため
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --glob "!{vendor/*,node_modules/*,.git/*,tmp/*,tags,.ruff_cache/*,**/__pycache__/*,**/.pytest_cache/*}" || true'
export FZF_DEFAULT_OPTS='--height 40% --reverse --border'

export BUNDLER_EDITOR='nvim'
