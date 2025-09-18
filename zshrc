# Clone the following repos to $HOME/.y-hu-zsh/ dir
# https://github.com/zsh-users/zsh-autosuggestions
export ZSH="$HOME/workdir"
source $ZSH/zsh-autosuggestions/zsh-autosuggestions.zsh

# Theme
# https://starship.rs/
eval "$(starship init zsh)"

# alias
alias ll="ls -lh --color=auto"
alias hh="cd ~/workdir"
alias vim="nvim"

# grep result highlight
export GREP_OPTIONS='--color=auto'

# ls -lh | grep REGEX_PATTERN
alias lg="ls -lh | rg"

# Functions
# -a is required otherwise fd returns relative path with regard to --base-directory
open_with_fzf() {
    fd -H -I -a --type file --base-directory $HOME/workdir | fzf -m | xargs -o nvim
}
zle -N open_with_fzf

cd_with_fzf() {
    cd "$HOME/workdir/$( fd --one-file-system --type directory --base-directory $HOME/workdir | fzf )"
    zle .reset-prompt
}
zle -N cd_with_fzf


# key bindings
# https://zsh.sourceforge.io/Intro/intro_11.html
# -s means it's not a widget, it's a command
bindkey -s 'vmo' 'nvim $( fd -H -I --type file . | fzf -m )\n'
bindkey 'neio' 'open_with_fzf'
bindkey 'oien' 'cd_with_fzf'
bindkey 'arst' 'autosuggest-accept'


# ZSH Configs
KEYTIMEOUT=20 # default 40

# load private settings that's not version controlled
if [ -f ~/.zshrc_private ]; then
    source ~/.zshrc_private
fi

# load fzf key binds
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# make sure all iTerm tabs share the same command history
setopt inc_append_history    # Write to history immediately
setopt share_history         # Share history between sessions
