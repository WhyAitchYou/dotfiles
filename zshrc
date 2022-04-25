# Clone the following repos to $HOME/.y-hu-zsh/ dir
# https://github.com/zsh-users/zsh-autosuggestions
export ZSH="$HOME/.y-hu-zsh"
source $ZSH/zsh-autosuggestions/zsh-autosuggestions.zsh


# Theme
# https://starship.rs/
eval "$(starship init zsh)"

# alias
alias ls="ls --color=auto"
alias ll="ls -l --color=auto"
alias ..="cd .."
alias ..2="cd ../.."
alias hh="cd ~"


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
    fd -H -I -a --type file --base-directory $HOME/workdir | fzf -m | xargs -o vim
}
zle -N open_with_fzf

cd_with_fzf() {
    cd "$( fd --one-file-system --type directory -H -a --base-directory $HOME/workdir | fzf )"
    zle .reset-prompt
}
zle -N cd_with_fzf


# key bindings
# https://zsh.sourceforge.io/Intro/intro_11.html
# -s means it's not a widget, it's a command
bindkey -s 'vmo' 'vim $( fd -H -I --type file . | fzf -m )\n'
bindkey 'neio' 'open_with_fzf'
bindkey 'oien' 'cd_with_fzf'
bindkey 'arst' 'autosuggest-accept'


# ZSH Configs
KEYTIMEOUT=20 # default 40



