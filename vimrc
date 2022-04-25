"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" author: Y. Hu <WhyAitchYou@gmail.com>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins Installation
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Plug 'sheerun/vim-polyglot'

" Function: Git visual helper
" Source: https://github.com/airblade/vim-gitgutter
" :help gitgutter
Plug 'airblade/vim-gitgutter'

" Function: Color Theme
" Source: https://github.com/sainnhe/everforest
" Source: https://github.com/junegunn/seoul256.vim
" :help everforest
" seoul (dark):
" 	Range: 233(darkest) - 239(lightest)
" 	Default: 237
" seoul (light):
" 	Range: 252(darkest) - 256(lightest)
" 	Default: 253
" :let g:seoul256_background = <value>
Plug 'sainnhe/everforest'
Plug 'junegunn/seoul256.vim'
Plug 'aditya-azad/candle-grey'
Plug 'ldelossa/vimdark'
Plug 'ulwlu/elly.vim'

" Function: fuzzy file search
" Source: https://github.com/ctrlpvim/ctrlp.vim
" :help ctrlp
Plug 'ctrlpvim/ctrlp.vim'

" Function: Golang language plugin
" Source: https://github.com/fatih/vim-go
" https://github.com/fatih/vim-go-tutorial#archived-project-no-maintenance
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'majutsushi/tagbar'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors
set noshowmode
set history=50 textwidth=100
syntax enable
" colorscheme candle-grey-transparent
colorscheme vimdark
" colorscheme everforest
" colorscheme seoul256
" This line will turn background transparent
" hi Normal guibg=NONE ctermbg=NONE

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Feature List
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Feature: Hybrid line numbers
"   - Effect: combine both absolute & relative line number
"   - Motivation: use a mindset of "[go/select] [up/down] [X] lines"
"                 relative to the line where the cursor's at
"""
set number relativenumber cursorline

"""
" Feature: Insert Mode ESC remap
"   - Effect: type 'jk' to exit insert mode
"   - Motivation: alternative to <ESC> or <C-[> or <C-c>
"   - Sideeffect1: if, you want to type 'jk', then you have to wait
"                 for the timeout after typing 'j' before typing 'k'.
"                 default timeout is 500 ms, you can adjust it with
"                 ':timeoutlen'
"   - SideEffect2: disable remap ESC to NOP because otherwise Vim will
"                 capture the command & tab key strokes when you're in
"                 INSERT mode.
"                 https://stackoverflow.com/questions/53311607/
"""
set timeoutlen=500
inoremap jl <ESC>
" inoremap <ESC> <NOP>

"""
" Feature: Terminal Insert Mode ESC remap
"   - Effect: type 'jk' to exit insert mode in Terminal
"   - Motivation: Default <C-R>N (capital N) is too cumbersome
"""
tnoremap jk <C-\><C-n>

"""
" Feature: Vertically centered cursor line
"   - Effect: search/line-moving/hjkl always keep cursor at the middle of the screen
"   - Motivation: equivalent to typing 'zz' after every cursor moves
"""
" set scrolloff=999

"""
" Feature: Move the cursor by "display" line, not "physical" lines
"   - Effect: j (Down) & k (Up) now act as gj & gk
"   - Motivation: for long wrapping lines, the behavior of 'j' 'k' is counterintuitive
"""
set colorcolumn=-1
nnoremap j gj
nnoremap k gk
highlight TrailingSpaces ctermbg=9 guibg=#ff5874
match TrailingSpaces /\s\+$/
autocmd BufWinEnter * match TrailingSpaces /\s\+$/
autocmd InsertEnter * match TrailingSpaces /\s\+\%#\@<!$/
autocmd InsertLeave * match TrailingSpaces /\s\+$/
autocmd BufWinLeave * call clearmatches()


function! GitBranch()
  return system("git rev-parse --abbrev-ref HEAD 2>/dev/null | tr -d '\n'")
endfunction

function! StatuslineGit()
  let l:branchname = GitBranch()
  return strlen(l:branchname) > 0?'  '.l:branchname.' ':''
endfunction

set statusline=
set statusline+=%#PmenuSel#
set statusline+=%{StatuslineGit()}
set statusline+=%#LineNr#
set statusline+=\ %f
set statusline+=%m\
set statusline+=%=
set statusline+=%#CursorColumn#
set statusline+=\ %y
set statusline+=\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\[%{&fileformat}\]
set statusline+=\ %p%%
set statusline+=\ %l:%c
set statusline+=\



"""
" Feature:
"   - Effect:
"   - Motivation:
"""
set wildmenu wildmode=full
set wildcharm=<C-Z>
nnoremap - :b <C-Z>

"""
" Feature:
"   - Effect:
"   - Motivation:
"""
set wildignore=*.pyc
set cmdheight=2

"""
" Feature:
"   - Effect:
"   - Motivation:
"""
set showtabline=2
let mapleader=' '
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt
nnoremap <leader>0 :tablast<CR>
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>w :tabclose<CR>

" netrw tree view
"""
" Feature:
"   - Effect:
"   - Motivation:
"""
let g:netrw_liststyle=3
let g:netrw_banner=0
" let g:netrw_browse_split=4
let g:netrw_winsize = 20
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END

"""
" Feature:
"   - Effect:
"   - Motivation:
"""
function! Comment()
  let ext = &filetype
  if ext == 'php' || ext == 'ruby' || ext == 'sh' || ext == 'python' || ext == 'yaml'
    s/^/\# /
  elseif ext == 'javascript' || ext == 'java' || ext == 'cpp' || ext == 'go' || ext == 'scala'
    s:^:\/\/ :g
  elseif ext == 'vim'
    s:^:\" :g
  endif
endfunction

function! Uncomment()
  let ext = &filetype
  if ext == 'php' || ext == 'ruby' || ext == 'sh' || ext == 'python' || ext == 'yaml'
    s/^\# //
  elseif ext == 'javascript' || ext == 'java' || ext == 'cpp' || ext == 'go' || ext == 'scala'
    s:^\/\/ ::g
  elseif ext == 'vim'
    s:^\" ::g
  endif
endfunction

" map <C-\> :call Comment()<CR>
" map <C-]> :call Uncomment()<CR>

"""
" Feature:
"   - Effect:
"   - Motivation:
"""
"""
" hlsearch will highlight all the searched instances
" but, when you're no longer interested in the search,
" there's no easy way to remove the highlighting, other
" than typing ':nohlsearch'. So here I map space+return key to
" the command ':nohlsearch<CR>'.
" Originally the return <CR> key moves the cursor to next
" line; now with the mapping it will execute ':nohlsearch'
" instead.
" I intentionally avoid adding <silent> here, is to make
" everything transparent to users that adopt this vimrc.
"""
set hlsearch
set incsearch
set ignorecase
set smartcase
"""
" in normal mode, map return key, to the command nohlsearch
"""
nnoremap <leader><CR> :nohlsearch<CR>

"""
" https://gist.github.com/mahemoff/8967b5de067cffc67cec174cb3a9f49d
" with ++close option
" type "exit" or "ctrl-D" to exit terminal
"""
nnoremap <leader>` :vert term ++close<CR>


set splitbelow
set splitright

"""
" Getting 'Prettier: failed to parse buffer' error
" https://github.com/prettier/vim-prettier/issues/268
" The ^ solution doesn't work for me.
" TODO: need to fix this prettier or remove it
"""
" let g:prettier#config#single_quote = 'true'
" let g:prettier#config#trailing_comma = 'all'


"""
" Use https://stackoverflow.com/questions/357785 the python syntax file to handle folding.
" za, zf (doesn't seem to work), zM, zR
set foldmethod=indent


"""
" Add spell checking
" https://thoughtbot.com/blog/vim-spell-checking
"
" set spell spelllang=en_us

"""
" display tab
" https://vi.stackexchange.com/questions/422/displaying-tabs-as-characters
"
set list
set listchars=tab:\|·


"""
" Resume last working session, reopen all the tabs/buffers
" :mksession XXX.vim

"""
" TODO: should i add the entire /.vim folder to repo for tracking?
" like plugins under /.vim/ dir.
"
"
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype css setlocal tabstop=2 shiftwidth=2 softtabstop=2
autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype c setlocal tabstop=4 shiftwidth=4 softtabstop=4

autocmd FileType c call tagbar#autoopen(0)
autocmd FileType python call tagbar#autoopen(0)

"""
" fix vim in tmux has no color
"""
set term=xterm-256color
