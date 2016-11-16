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

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle. This is required.
Bundle 'gmarik/vundle'

" My bundles here:
Bundle 'smerrill/vcl-vim-plugin'
Bundle 'altercation/vim-colors-solarized'
Bundle 'smerrill/ActionScript'
Bundle 'vim-scripts/LargeFile'
Bundle 'vim-scripts/PHP-correct-Indenting'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
" Revert to 1.7 in my repo.
Bundle 'smerrill/phpfolding.vim'
Bundle 'ervandew/supertab'
Bundle 'vim-scripts/taglist.vim'
Bundle 'tpope/vim-surround'
Bundle 'hallison/vim-markdown'
Bundle 'mileszs/ack.vim'
Bundle 'vim-scripts/Puppet-Syntax-Highlighting'
Bundle 'smerrill/vagrant-vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'millermedeiros/vim-statline'
Bundle 'scrooloose/syntastic'
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Bundle 'smerrill/vim-arduino'
Bundle 'benmills/vimux'
Bundle 'othree/html5.vim'
Bundle 'fatih/vim-go'
Bundle 'tpope/vim-classpath'
Bundle 'guns/vim-clojure-static'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'rodjek/vim-puppet'
Bundle 'godlygeek/tabular'
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"
Bundle 'honza/vim-snippets'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'chase/vim-ansible-yaml'
Bundle 'wincent/terminus'
Bundle 'flazz/vim-colorschemes'

" Fix UTF-8 issues on Linuxes.
scriptencoding utf-8

if !has("gui_running")
  " Oh, OS X.
  set t_Co=256
  "colorscheme mustang
  colorscheme zenburn
else
  " Set color scheme
  colorscheme zenburn
endif

" Ag is better than Ack!
let g:ackprg = 'ag --vimgrep --smart-case'

" Only wait for 400 ms before applying a key.
set timeoutlen=400

" Keep swp files under ~/.vim/swap
set directory=~/.vim/swap,~/tmp,.

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

" Stop it, hash key.
inoremap # X<BS>#

" Make working with splits a little easier and stop opening 1 line high splits.
au BufWinEnter * exe "normal! \<c-w>="

" Force syntax highlighting when buffers close.
set hidden
let g:miniBufExplForceSyntaxEnable = 1

" Do not check puppet syntax, since Ruby is le slow.
let g:syntastic_disabled_filetypes = ['puppet', 'scss', 'scala']
let g:syntastic_phpcs_conf=" --standard=Drupal --extensions=php,module,inc,install,test,profile,theme"

" Map v keys for vimux.
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vv :VimuxRunLastCommand<CR>
map <Leader>vq :VimuxCloseRunner<CR>

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

" Get out of insert mode without leaving home row.
inoremap jk <esc>

" Always show the statusline.
set laststatus=2

" Use an omnifunc if it's available.
let g:SuperTabDefaultCompletionType = "<C-P>"
autocmd FileType go let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
autocmd FileType php let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
autocmd FileType clojure let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

" @TODO: Move the below to plugins.

" Set up vim for optimal use with Drupal.
au BufNewFile,BufRead *.engine set filetype=php
au BufNewFile,BufRead *.theme set filetype=php
au BufNewFile,BufRead *.module set filetype=php
au BufNewFile,BufRead *.test set filetype=php
au BufNewFile,BufRead *.install set filetype=php
au BufNewFile,BufRead *.inc set filetype=php
au BufNewFile,BufRead *.profile set filetype=php

" Fold YAML by indentation.
au BufNewFile,BufRead *.yaml set foldmethod=indent

" Correct tab stops for golang.
autocmd Filetype go setlocal noexpandtab shiftwidth=2 tabstop=2

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

" Easy vertical window splits.
nnoremap <C-w>N :vnew<cr>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" After much consideration, I do want wrapping.
set wrap
" My kingdom for 'list' and 'linebreak' playing nicely together.
" set linebreak

" But since I'm wrapping lines, I do expect j and k to move one line in the editor, not in the file.
nmap j gj
nmap k gk

" Stolen from reddit. Make it super easy to open CtrlP (for files or buffers)
" with leader commands.
nnoremap <leader>, :CtrlP<Enter>
nnoremap <leader>. :CtrlPBuffer<Enter>

" Don't search VCS directories, CtrlP.
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*.so,*.class,*.jar

" Don't have CtrlP manage the working directory.
let g:ctrlp_working_path_mode = 0
"let g:ctrlp_show_hidden = 1

" Editing a LISP with vim? Heresy!
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['red',         'firebrick3'],
    \ ]
au BufNewFile,BufReadPost *.clj RainbowParenthesesLoadRound
au BufNewFile,BufReadPost *.clj RainbowParenthesesActivate
"autocmd BufWritePost *.clj silent Refresh!

" Have CtrlP follow symlinks.
let g:ctrlp_follow_symlinks = 1

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

