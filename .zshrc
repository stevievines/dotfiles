# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh
export AWS_ID=kevy
export AWS_SECRET=kevy

#Karma App Environment Variables
export KARMAAPP_USERNAME="bc@karmaapp.io"
export FACEBOOK_APP_KEY="1070909042925896"
export FACEBOOK_APP_SECRET="b46f71c271b7709f6bd54a4dee3baa58"
export TWITTER_APP_KEY="BESvCuNZKmS1qQ7ALitQ64Dum"
export TWITTER_APP_SECRET="lNonjEF9yfj2IK3hVteYvDC8ShacrKEswwjvqR5YlDBQeNZub6"
export LINKEDIN_APP_KEY="755pnfgevpnqkm"
export LINKEDIN_APP_SECRET="y92vkU30M8dtonPW"
export GITHUB_APP_KEY="82836b1a19efee4a21d7"
export GITHUB_APP_SECRET="85fce6e5e238ab6a1e437831ed1c3d89a51f67bb"
export GOOGLE_OAUTH2_APP_KEY="350026466559-5abgvslumt3f58b2tqqra33vf6ocqqc5.apps.googleusercontent.com"
export GOOGLE_OAUTH2_APP_SECRET="uDpEQIEVoGlu49jl5-4l6rWC"
export INSTAGRAM_APP_KEY="2e5dce8597c1425e96eff7f58ff1f15e"
export INSTAGRAM_APP_SECRET="b250021287854acc8bf878d841d56ff1"
export PINTEREST_APP_KEY="1444547"
export PINTEREST_APP_SECRET="b250021287854acc8bf878d841d56ff1"

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias don='pair up strukturedkaos'
alias tmux-start='sh /usr/share/tmux-start.sh'

alias clean-branches="git checkout master; git fetch; git rebase; git branch --merged | grep -v '\*' | xargs -n 1 git branch -D"

alias mm="middleman"
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
export PATH=$PATH:/Users/Stevie/.rvm/gems/ruby-1.9.3-p429/bin:/Users/Stevie/.rvm/gems/ruby-1.9.3-p429@global/bin:/Users/Stevie/.rvm/rubies/ruby-1.9.3-p429/bin:/Users/Stevie/.rvm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/Users/Stevie/bin
path+=('/home/Stevie/npm/bin')

# Kevy Redis for prod stuff locally
export REDIS=redis://127.0.0.1:6379/0

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH="/Users/Stevie/.rvm/gems/ruby-1.9.3-p448/bin":$PATH
