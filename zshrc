# Clone the following repos to $HOME/.y-hu-zsh/ dir
# https://github.com/spaceship-prompt/spaceship-prompt.git
# https://github.com/zsh-users/zsh-autosuggestions
export ZSH="$HOME/.y-hu-zsh"
source $ZSH/spaceship-prompt/spaceship.zsh-theme
source $ZSH/zsh-autosuggestions/zsh-autosuggestions.zsh


# alias
alias ls="ls --color=auto"


# pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH=$PYENV_ROOT/bin:$PATH
eval "$(pyenv init --path)"
eval "$(pyenv virtualenv-init -)"


# functions
open_with_fzf() {
    cd $HOME && fd -H --type file --type directory | fzf | xargs -o vim
}
zle -N open_with_fzf

cd_with_fzf() {
    cd $HOME && cd "$( fd -t d | fzf )"
    zle .reset-prompt
}
zle -N cd_with_fzf


# key bindings
bindkey -s '^v' 'vim\n'
bindkey '^o' 'open_with_fzf'
bindkey '^f' 'cd_with_fzf'

