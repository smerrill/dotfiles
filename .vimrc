"
" .vimrc
"
" Steven Merrill (@stevenmerrill)
"

" This apparently must be first. Bye, vi-compatibility!
set nocompatible

" Stop vim from exiting with status 1.
filetype on

" Autoload with Pathogen.
filetype off
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

" Fix UTF-8 issues on Linuxes.
scriptencoding utf-8
set encoding=utf-8

if !has("gui_running")
  " Oh, OS X.
  set t_Co=256
  colorscheme mustang
else
  " Set color scheme
  set background=light
  colorscheme solarized
endif

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Get smarter about indenting.
set autoindent
set smartindent

" Show commands in flight
set showcmd

" Give some context while scrolling.
set scrolloff=3

" Don't you beep at me.
set visualbell

" Fix an apparent security vulnerability
set modelines=0

" 2 spaces, not tabs.
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Set up a much nicer leader.
let mapleader = ","

" Make wildcard completions work more like a shell.
set wildmenu
set wildmode=list:longest

" Shortcut to rapidly toggle `set list`
" Default it to on
set list
nmap <leader>l :set list!<CR>

" Use the same symbols as TextMate for tabstops
" and a handy dot for trailing spaces.
set listchars=tab:▸\ ,eol:¬,trail:·,extends:›,precedes:‹

" Tame searching and moving, a la Steve Losh.
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

" Arrow keys are for wusses.
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>

" Fun with visual displays.
set ruler
set number

" Sidebar plugin options
let NERDTreeShowHidden=1
let Tlist_Use_Right_Window=1
let Tlist_Use_Horiz_Window=1

" @TODO: Move the below to plugins.

" Set up vim for optimal use with Drupal.
au BufNewFile,BufRead *.engine set filetype=php
au BufNewFile,BufRead *.theme set filetype=php
au BufNewFile,BufRead *.module set filetype=php
au BufNewFile,BufRead *.test set filetype=php
au BufNewFile,BufRead *.install set filetype=php
au BufNewFile,BufRead *.inc set filetype=php

" Good completion.
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType inc set omnifunc=phpcomplete#CompletePHP

" Set vim up for optimal use with Scala.
hi scalaNew gui=underline
hi scalaMethodCall gui=italic
hi scalaValName gui=underline
hi scalaVarName gui=underline

" Lots of history / undo.
set history=1000
set undolevels=1000

" Set the terminal title
set title

" Remove a couple presses of Shift from the normal vim workflow.
nnoremap ; :

" Easy window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Wrapping huge lines take a LOT of processor time. Who needs it?
set nowrap

" The default .vimrc follows.

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
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
  autocmd FileType text setlocal textwidth=78

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

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
      \ | wincmd p | diffthis
endif

