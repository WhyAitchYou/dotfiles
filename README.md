# Dotfiles

## Requirements

1. Run `vim --version | grep termguicolors`, if you see `+termguicolors`, then you should be fine;
   if you see `-termguicolors`, then your Vim doesn't support true color. You might have to check
   what Vim version you're using. If you're using mac, check if you're using the pre-built Vim or
   the Homebrew version. Run `vim --version` to find out. You might need `Huge version without GUI`
   instead of the `Normal version without GUI`.

   ```
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
   ```

3. Create a blank setting files for Vim.
   ```bash
   touch ~/.vimrc; mkdir ~/.vim
   ```

4. Symlink the `$HOME/.vimrc`.
   ```bash
   ln -s ./dotfiles/vimrc ./vimrc
   ```
