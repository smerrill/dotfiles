" Set up GUI options.
if has("mac")
  set guifont=Inconsolata:h14
elseif has("gui_gtk2")
  set guifont=Mensch\ 10
endif

"if has("linux")
"
"endif

set guioptions-=T

" Check spelling in a graphical Vim.
set spell

" On startup, if not editing one or more files, open NERDTree.
au VimEnter * if empty(expand('%')) | NERDTreeToggle | wincmd p | endif

