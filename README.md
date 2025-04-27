# dotfiles
why version control dotfiles? because one can have more than one computer,
and by central manage all dotfiles in one place, you get a uniform experience
across all your computers.

## requirements
0. tools
  ```bash
   $ brew list neovim || brew install neovim
   $ brew list fzf || brew install fzf
   $ brew list ripgrep || brew install ripgrep
   $ brew list fd || brew install fd
   $ brew list starship || brew install starship
   ```
1. NeoVim version >= 0.10.0
2. install fzf keybindings
  ```bash
  $ $(brew --prefix)/opt/fzf/install

  # uninstall is similar
  $ $(brew --prefix)/opt/fzf/uninstall
  ```

## setup

### iTerm

```bash
# ln -s <SOURCE> <symlink>
$ ln -s ~/workdir/dotfiles/zshrc ~/.zshrc
$ ln -s ~/workdir/dotfiles/starship.toml ~/.config/starship.toml
```
note: i use Colemak keyboard layout instead of Qwerty, so some keybinding may not make sense to you

- nerd font: "Hasklug Nerd Font" from [here](https://www.nerdfonts.com/font-downloads).
- color presets: "ForestBlue" from [here](https://github.com/olkinn/forest-blue-iTerm).
- `neio`: fzf files under ~/workdir and open it with nvim
- `oien`: fzf directories under ~/workdir and cd into it
- `Ctrl + r`: fzf terminal command history

### NeoVim

```bash
$ git clone https://github.com/WhyAitchYou/kickstart.nvim.git ~/workdir/kickstart.nvim

# ln -s <SOURCE> <symlink>
$ ln -s ~/workdir/kickstart.nvim/init.lua ~/.config/nvim/init.lua
```
note: symlink is pointing to my own forked repo

