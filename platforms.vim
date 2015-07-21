" ----------------------------------------
" Platform Specific Configuration
" ----------------------------------------

if has('win32') || has('win64')
  " Windows
  source $VIMRUNTIME/mswin.vim
  set guifont=Source\ Code\ Pro\ Semibold:h10.5
  set guioptions-=T " Hide Toolbar
  set guioptions-=m " Hide Menubar
  set guioptions-=r " Hide Right scrollbar
  set guioptions-=L " Hide Left scrollbar

  " Set height and width on Windows
  set lines=62
  set columns=120

  " Disable quickfixsigns on Windows due to incredible slowdown.
  let g:loaded_quickfixsigns=1
  " Disable italic text on gVim because of bad display
  let g:solarized_italic = 0

  " Windows has a nasty habit of launching gVim in the wrong working directory
  cd ~
elseif has('gui_macvim')
  " MacVim

  " Custom Source Code font for Powerline
  " From: https://github.com/Lokaltog/powerline-fonts
  set guifont=Source\ Code\ Pro\ for\ Powerline:h15

  " Hide Toolbar in MacVim
  if has("gui_running")
    set guioptions=egmrt
  endif

  " Use option (alt) as meta key.
  set macmeta
" LINUX
elseif !has('macunix') && !has('mac')
  set clipboard+=unnamedplus
endif

if !has('nvim') && (has('macunix') || has('mac'))
  " Fix meta key for Mac
  let c='a'
  while c <= 'z'
    exec "set <A-".c.">=\e".c
    exec "imap \e".c." <A-".c.">"
    let c = nr2char(1+char2nr(c))
  endw
endif
