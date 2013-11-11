# Fish config

# Aliases
alias c clear
alias g git
alias dj django-admin.py

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
#set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '↑'
set __fish_git_prompt_char_upstream_behind '↓'

# Python & pip
set -x PIP_USE_WHEEL "true"
set -x PIP_WHEEL_DIR "$HOME/.pip/wheels"
set -x PIP_FIND_LINKS "$HOME/.pip/wheels"
set -x PIP_DOWNLOAD_CACHE "$HOME/.pip/cache"

# Virtualenv helper - https://github.com/adambrenecki/virtualfish/
set -gx VIRTUALFISH_HOME $HOME/.venvs
. $HOME/.config/fish/virtualfish/virtual.fish
. $HOME/.config/fish/virtual_hooks.fish
