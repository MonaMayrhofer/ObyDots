"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/obyoxar/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/obyoxar/.cache/dein')
  call dein#begin('/home/obyoxar/.cache/dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/obyoxar/.cache/dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here like this:
  "call dein#add('Shougo/neosnippet.vim')
  "call dein#add('Shougo/neosnippet-snippets')
  call dein#add('wsdjeg/dein-ui.vim')
  call dein#add('mrk21/yaml-vim')
  call dein#add('WolfgangMehner/bash-support')
  call dein#add('cespare/vim-toml')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

set nowrap

set scrolloff=5

