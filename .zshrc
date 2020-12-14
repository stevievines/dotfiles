# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin

# for ruby
export PATH="/usr/local/bin:/usr/local/sbin:$PATH"

# cert.pem file for openssl NOTE this was here but didn't work on new computer, no idea why it was here
# export SSL_CERT_FILE=/usr/local/etc/openssl/certs/cert.pem

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="af-magic"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias don='pair up strukturedkaos'
alias tmux-start='sh /usr/share/tmux-start.sh'

alias cb="git checkout master && git fetch -p && git rebase && git branch --merged | grep -v '\*' | xargs -n 1 git branch -d"

alias mm="middleman"
alias vim="nvim"

alias cnin="cvx-ninja"
alias cprod="cvx-prod"
alias cprodw="cvx-prod-west"

alias mc="cd /Users/stevievines/src/github.com/GetTerminus/master-company"
alias inn="cd /Users/stevievines/code/GetTerminus/infra-terminus-ninja"

alias godotenvify="ruby -ne 'k, v = \$_.split(\"=\", 2); puts \"#{k}=#{v.chomp.inspect}\"'"
alias cvxrefresh="cvx-ninja env | godotenvify > .env"

# - use ripgrep with fzf
export FZF_DEFAULT_COMMAND='rg --files --hidden -g "!{vendor}"'

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
path+=('/home/Stevie/npm/bin')

#chruby stuff: https://yous.be/2016/01/01/switching-rvm-to-chruby/
if [ -e /usr/local/share/chruby/chruby.sh ]; then
  source /usr/local/share/chruby/chruby.sh
  source /usr/local/share/chruby/auto.sh
fi


# Postgres
# export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
# export PATH="/usr/local/opt/postgresql@9.6/bin:$PATH"

# AWS CLI
export PATH=~/Library/Python/3.6/bin:$PATH

### Added by the Heroku Toolbelt
# export PATH="/usr/local/heroku/bin:$PATH"

# for OpenCV, followed this: https://robferguson.org/blog/2017/10/06/how-to-install-opencv-and-python-using-homebrew-on-macos-sierra/
# Virtualenv/VirtualenvWrapper
#VIRTUALENVWRAPPER_PYTHON='/usr/local/bin/python3'
#source /usr/local/bin/virtualenvwrapper.sh
#export WORKON_HOME=$HOME/.virtualenvs
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
