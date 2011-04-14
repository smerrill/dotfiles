" Set up GUI options.
if has("mac")
  set guifont=Mensch:h12
elseif has("gui_gtk2")
  set guifont=Mensch\ 10
endif

"if has("linux")
"
"endif

set guioptions-=T

" Save on losing focus
" au FocusLost * :wa

" Always open NERDTree in graphical mode only.
"autocmd VimEnter * NERDTreeToggle
"autocmd VimEnter * wincmd p

" Set colors again for vim's benefit (?)
colorscheme vilight2

