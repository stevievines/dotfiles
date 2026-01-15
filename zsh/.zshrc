export EDITOR="nvim"

source ~/.secrets

export PATH="$PATH:$HOME/go/bin"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/Library/Python/3.11/bin"
export PATH="$HOME/.local/bin:$PATH"

alias vim="nvim"
alias dockerclean='docker rmi $(docker images -f "dangling=true" -q)'

# git aliases (formerly oh-my-zsh)
alias gst='git status'
alias gco='git checkout'
alias gb='git branch'
alias ggpull='git pull origin "$(git branch --show-current)"'
alias ggpush='git push origin "$(git branch --show-current)"'

# - use ripgrep with fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden'

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/SVines/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/SVines/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/SVines/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/SVines/google-cloud-sdk/completion.zsh.inc'; fi
eval "$(mise activate zsh)"
# https://github.com/ajeetdsouza/zoxide
eval "$(zoxide init zsh)"
eval "$(starship init zsh)"
