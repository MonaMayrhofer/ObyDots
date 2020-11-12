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

  " To install :call dein#install() and :DeinUpdate

  " DEIN (Plugin Manager UI)
  call dein#add('wsdjeg/dein-ui.vim')


  " Distraction Free writing
  call dein#add('junegunn/goyo.vim')
  call dein#add('junegunn/limelight.vim')
"  call dein#add('oinkoboinko/yoink.vim')

  " Language Integrations
  call dein#add('mrk21/yaml-vim')
  call dein#add('WolfgangMehner/bash-support')
  call dein#add('cespare/vim-toml')
  call dein#add('Shougo/deoplete.nvim')
  if !has('nvim')
	call dein#add('roxma/nvim-yarp')
	call dein#add('roxma/vim-hug-neovim-rpc')
  endif
  let g:deoplete#enable_at_startup = 1
  call dein#add('deoplete-plugins/deoplete-clang')

  " Grammar and Spell checking
  call dein#add('rhysd/vim-grammarous')


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


" Limelight and Goyo Integration and Color scheme
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_guifg = '#777777'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
