# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

export EDITOR="nvim"

source ~/.secrets

export PATH="$PATH:$HOME/go/bin"
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"
export PATH="$PATH:$HOME/Library/Python/3.11/bin"
export PATH="$HOME/.local/bin:$PATH"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="af-magic"

#carvana
alias azlogin='az login && az acr login --name cvnadev && az acr login --name cvnatest && az acr login --name cvnaprod && az acr login --name cvnaimages && az acr login --name cvnaimagesdev'
alias vex='cd ~/code/carvana/vex/'
alias dockerclean='docker rmi $(docker images -f "dangling=true" -q)'
alias cc="CLAUDE_CODE_USE_VERTEX=1 CLOUD_ML_REGION=us-east5 ANTHROPIC_VERTEX_PROJECT_ID=crv-engineering-ai-prd-8058 claude"
alias vim="nvim"

# - use ripgrep with fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden'

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/SVines/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/SVines/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/SVines/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/SVines/google-cloud-sdk/completion.zsh.inc'; fi
eval "$(mise activate zsh)"
