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

Plug 'itchyny/lightline.vim'
Plug 'sheerun/vim-polyglot'
Plug 'bluz71/vim-nightfly-guicolors'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set termguicolors
colorscheme nightfly
set noshowmode

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Feature List
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Feature: Hybrid line numbers
"   - Effect: combine both absolute & relative line number
"   - Motivation: use a mindset of "[go/select] [up/down] [X] lines"
"                 relative to the line where the cursor's at
"""
set relativenumber
set cursorline

"""
" Feature: Insert Mode ESC remap
"   - Effect: type 'jkl' to exit insert mode
"   - Motivation: alternative to <ESC> or <C-[> or <C-c>
"   - Sideeffect: if, you want to type 'jk', then you have to wait 
"                 for the timeout after typing 'j' before typing 'k'.
"                 default timeout is 1000 ms, you can adjust it with
"                 ':timeoutlen'
"   - Demo (Optional)
"""
inoremap jk <ESC>
inoremap <ESC> <NOP>
set timeoutlen=300



set history=50
syntax enable
set scrolloff=999

nnoremap j gj
nnoremap k gk



set laststatus=2

set wildmenu

set wildignore=*.pyc
set cmdheight=2

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

" netrw tree view
let g:netrw_liststyle=3
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_winsize = 20
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
augroup END

function! Comment()
  let ext = &filetype
  if ext == 'php' || ext == 'ruby' || ext == 'sh' || ext == 'python'
    s/^/\# /
  elseif ext == 'javascript' || ext == 'java' || ext == 'cpp' || ext == 'go' || ext == 'scala'
    s:^:\/\/ :g
  elseif ext == 'vim'
    s:^:\" :g
  endif
endfunction

function! Uncomment()
  let ext = &filetype
  if ext == 'php' || ext == 'ruby' || ext == 'sh' || ext == 'python'
    s/^\# //
  elseif ext == 'javascript' || ext == 'java' || ext == 'cpp' || ext == 'go' || ext == 'scala'
    s:^\/\/ ::g
  elseif ext == 'vim'
    s:^\" ::g
  endif
endfunction

map <C-\> :call Comment()<CR>
map <C-]> :call Uncomment()<CR>

"""
" hlsearch will highlight all the searched instances
" but, when you're no longer interested in the search,
" there's no easy way to remove the highlighting, other
" than typing ':nohlsearch'. So here I map return key to
" the command ':nohlsearch<CR>'.
" Originally the return <CR> key moves the cursor to next
" line; now with the mapping it will execute ':nohlsearch'
" instead.
" I intentionally avoid adding <silent> here, is to make
" everything transparent to users that adopt this vimrc.
"""
set hlsearch
set incsearch
"""
" in normal mode, map return key, to the command nohlsearch
"""
nnoremap <leader><CR> :nohlsearch<CR>


