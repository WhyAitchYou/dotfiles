# Clone the following repos to $HOME/.y-hu-zsh/ dir
# https://github.com/spaceship-prompt/spaceship-prompt.git
# https://github.com/zsh-users/zsh-autosuggestions
export ZSH="$HOME/.y-hu-zsh"
source $ZSH/spaceship-prompt/spaceship.zsh-theme
source $ZSH/zsh-autosuggestions/zsh-autosuggestions.zsh


# alias
alias ls="ls --color=auto"


# pyenv ver >=2.2.5 installed via homebrew
# brew upgrade pyenv
# BE AWARE: the order of below two evals must be like this, not reversed
# because $(pyenv init --path) should be put inside zprofile, which gets sourced
# before zshrc (i am just lazy so put them together here)
eval "$(pyenv init --path)"
eval "$(pyenv init -)"


# functions
open_with_fzf() {
    cd $HOME && fd -H --type file --type directory | fzf | xargs -o vim
}
zle -N open_with_fzf

cd_with_fzf() {
    cd $HOME && cd "$( fd --one-file-system --type directory | fzf )"
    zle .reset-prompt
}
zle -N cd_with_fzf


# key bindings
# https://zsh.sourceforge.io/Intro/intro_11.html
bindkey -s '^v' 'vim .\n'
bindkey '^o' 'open_with_fzf'
bindkey '^f' 'cd_with_fzf'


# Spaceship Configs
# https://spaceship-prompt.sh/options
SPACESHIP_PYENV_SHOW=false # disable pyenv icon in prompt
SPACESHIP_CHAR_SYMBOL="$ "
SPACESHIP_CHAR_SYMBOL_SECONDARY="$ "

