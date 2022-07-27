# Dotfiles

## Workflow
*. Go to a folder by folder name
*. Go to a file by filename
*  Vim - search substring in files in pwd
*. Vim - check all buffers

## Requirements
0.
  ```bash
   $ brew list fzf || brew install fzf
   $ brew list ripgrep || brew install ripgrep
   $ brew list fd || brew install fd
   ```
1. Vim version 8.0+
2. Vim `termguicolors` true color feature enabled.
3. Inside Vim, run `:echo $TERM` and check if the value is `xterm-256color`;
   run `:echo &t_Co` and check if the value is `256`.

   Run `vim --version | grep termguicolors`; if you see `+termguicolors`, then you should be fine;
   if you see `-termguicolors`, then your Vim doesn't support true color. You might have to check
   what Vim version you're using. If you're using mac, check if you're using the pre-built Vim or
   the Homebrew version. Run `vim --version` to find out. You might need `Huge version without GUI`
   instead of the `Normal version without GUI`.

   ```bash
   ➜ vim --version
   VIM - Vi IMproved 8.2 (2019 Dec 12, compiled Nov 25 2020 22:10:06)
   macOS version
   Included patches: 1-2050
   Compiled by Homebrew
   Huge version without GUI.  Features included (+) or not (-):
   +acl               -farsi             +mouse_sgr         +tag_binary
   +arabic            +file_in_path      -mouse_sysmouse    -tag_old_static
   +autocmd           +find_in_path      +mouse_urxvt       -tag_any_white
   +autochdir         +float             +mouse_xterm       -tcl
   -autoservername    +folding           +multi_byte        +termguicolors
   -balloon_eval      -footer            +multi_lang        +terminal
   +balloon_eval_term +fork()            -mzscheme          +terminfo
   -browse            +gettext           +netbeans_intg     +termresponse
   ++builtin_terms    -hangul_input      +num64             +textobjects
   +byte_offset       +iconv             +packages          +textprop
   +channel           +insert_expand     +path_extra        +timers
   +cindent           +ipv6              +perl              +title
   -clientserver      +job               +persistent_undo   -toolbar
   +clipboard         +jumplist          +popupwin          +user_commands
   +cmdline_compl     +keymap            +postscript        +vartabs
   +cmdline_hist      +lambda            +printer           +vertsplit
   +cmdline_info      +langmap           +profile           +virtualedit
   +comments          +libcall           -python            +visual
   +conceal           +linebreak         +python3           +visualextra
   +cryptv            +lispindent        +quickfix          +viminfo
   +cscope            +listcmds          +reltime           +vreplace
   +cursorbind        +localmap          +rightleft         +wildignore
   +cursorshape       +lua               +ruby              +wildmenu
   +dialog_con        +menu              +scrollbind        +windows
   +diff              +mksession         +signs             +writebackup
   +digraphs          +modify_fname      +smartindent       -X11
   -dnd               +mouse             -sound             -xfontset
   -ebcdic            -mouseshape        +spell             -xim
   +emacs_tags        +mouse_dec         +startuptime       -xpm
   +eval              -mouse_gpm         +statusline        -xsmp
   +ex_extra          -mouse_jsbterm     -sun_workshop      -xterm_clipboard
   +extra_search      +mouse_netterm     +syntax            -xterm_save
      system vimrc file: "$VIM/vimrc"
        user vimrc file: "$HOME/.vimrc"
    2nd user vimrc file: "~/.vim/vimrc"
         user exrc file: "$HOME/.exrc"
          defaults file: "$VIMRUNTIME/defaults.vim"
     fall-back for $VIM: "/usr/local/share/vim"
   Compilation: clang -c -I. -Iproto -DHAVE_CONFIG_H   -DMACOS_X -DMACOS_X_DARWIN  -g -O2 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=1
   Linking: clang   -L. -fstack-protector-strong -L/usr/local/lib -L/usr/local/opt/libyaml/lib -L/usr/local/opt/openssl@1.1/lib -L/usr/local/op
   t/readline/lib  -L/usr/local/lib -o vim        -lm  -lncurses -liconv -lintl -framework AppKit  -L/usr/local/opt/lua/lib -llua5.3 -mmacosx-v
   ersion-min=11.0 -fstack-protector-strong -L/usr/local/lib  -L/usr/local/Cellar/perl/5.32.0/lib/perl5/5.32.0/darwin-thread-multi-2level/CORE
   -lperl  -L/usr/local/opt/python@3.9/Frameworks/Python.framework/Versions/3.9/lib/python3.9/config-3.9-darwin -lpython3.9 -framework CoreFoun
   dation  -lruby.2.7
   ```

## How-To

1. Clone this repository.
   ```bash
   git clone [ssh/https url]
   ```

2. Archieve your current Vim settings.
   ```bash
   mv ~/.vim/ ~/.vim-legacy/; mv ~/.vimrc ~/.vimrc-legacy
   mv ~/.zshrc ~/.zshrc-legacy;
   ```

3. Symlink the `$HOME/.vimrc`. (Assume you are at the same directory as in step 1)
   ```bash
   ln -s ./dotfiles/vimrc ~/.vimrc
   ln -s ./dotfiles/zshrc ~/.zshrc
   ```

4. Open Vim!

5. Install the plug-ins.
   ```vim
   :PlugInstall
   ```

6. When in doubt, check Vim's documentation!


### Search + Replace
`:%s/search/replace/gc` where `g` means globe (entire file), `c` means confirmation.

### Read Only


### Copy-Paste between windows


### Copy-Paste between system clipboard
* Copy text from system clipboard: `"+p`
* Copy text to system clipboard: `"+y`

## Commands

### Windows
* Open a blank split: `<CTRL-W>n`
* Open current file in a new split (Right-side): `<CTRL-W>v`
* Open current file in a new split (Down-side): `<CTRL-W>s`
* Close split: `<CTRL-W>c`

### Tabs
* Create a new tab: `<Space>t`
* Close current tab: `<Space>w`
* Go to tab 1: `<Space>1`
* Go to tab 2: `<Space>2`
* ...
* Go to tab 9: `<Space>9`
* Go to last tab: `<Space>0`

### Page Viewer
* Show current line in the __B__ottom of the screen: `zb`
* Show current line in the __T__op of the screen: `zt`
* Show current line in the __M__iddle of the screen: `zz`, `z.`
* Scroll down: `<CTRL-D>`
* Scroll up: `<CTRL-U>`
* Scroll page forward: `<CTRL-F>`
* Scroll page backward: `<CTRL-B>`

### Comment/Uncomment
* Comment a code block: `<CTRL>\`
* Uncomment a code block: `<CTRL>]`

### Insert Mode
* Enter Insert Mode: `i`
* Exit Insert Mode: `jk`

### Terminal Emulator Insert Mode
* Enter Terminal's Insert Mode: `i`
* Exit Terminal's Insert Mode: `jk`

### Buffer
* Select from opened buffers: `-<Tab>`

* Search
   * Search: `/`
   * Turn off highlights after searching: `<Space><CR>`
