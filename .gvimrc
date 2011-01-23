" Set up GUI options.
if has("mac")
  set guifont=Menlo:h13
elseif has("gui_gtk2")
  set guifont=Liberation\ Mono\ 11
endif

"if has("linux")
"
"endif

set guioptions-=T

" Set color scheme
color vilight2

" Save on losing focus
" au FocusLost * :wa

