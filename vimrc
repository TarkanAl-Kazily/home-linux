" sets default tabsize to 4
set sw=4
set tabstop=4
set lbr
set ai
set si
set wrap!
set hlsearch

" replaces tabs with spaces
set expandtab

" turns on the cursor tracker
set ruler
set number

" Enables cool clipboard integration
set clipboard=unnamed

set updatetime=500

set nomodeline
" Enables deleting lines with backspace
set backspace=2
"""""""""""
" Plugins
"""""""""""

" Must install vim-plug for this to work
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" initializes vim-plug (plugin manager) and its plugins
call plug#begin('~/.vim/plugged')

Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'TarkanAl-Kazily/vimscry'

Plug 'fsharp/vim-fsharp', {
      \ 'for': 'fsharp',
      \ 'do':  'make fsautocomplete',
      \}

call plug#end()

let g:airline_powerline_fonts = 1

set laststatus=2

"""""""""""
" Colors
"""""""""""

syntax on

colorscheme delek

set ffs=unix,dos,mac

set encoding=utf8

"""""""""""
" File type detection
"""""""""""

autocmd! BufNewFile,BufRead *.ino,*.pde set filetype=cpp
" Requires a qs filetype highlighting file
autocmd! BufNewFile,BufRead *.qs set filetype=qs

if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  " autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent                " always set autoindenting on

endif " has("autocmd")

""""""""""""
" Custom Commands
""""""""""""
let mapleader = ","
nnoremap <leader>f :NERDTreeToggle<CR>
nnoremap <leader>t :NERDTreeFocus<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
