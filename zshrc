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


# pyenv ver >=2.2.5 installed via homebrew
# brew upgrade pyenv
# BE AWARE: the order of below two evals must be like this, not reversed
# because $(pyenv init --path) should be put inside zprofile, which gets sourced
# before zshrc (i am just lazy so put them together here)
eval "$(pyenv init --path)"
eval "$(pyenv init -)"

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

alias sshx86="ssh -p 19905 -i ~/.ssh/x86rsa bunspeader@192.168.87.234"
# this only tunnel the port for jupyter notebook in the background without allowing running commands
alias notebookx86="ssh -p 19905 -N -f -L localhost:9999:localhost:9999 bunspeader@192.168.87.234"
alias sshm1="ssh yhu@192.168.87.3"
alias project="nvim ~/workdir/tracker/project.md"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
