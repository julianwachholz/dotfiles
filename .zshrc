# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="jwa"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(ssh-agent git django python pip virtualenvwrapper svn)

# Setup SSH keys
zstyle :omz:plugins:ssh-agent identities id_vps_work id_work id_github_work

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH="${PATH}":~/.bin:~/.gem/ruby/2.0.0/bin
export LD_LIBRARY_PATH=/opt/java/jre/lib/amd64
unset JAVA_HOME
