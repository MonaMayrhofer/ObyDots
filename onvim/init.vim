set shell=/bin/bash
let mapleader = "\<Space>"

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

  " FZF
  call dein#add('airblade/vim-rooter')
  call dein#add('junegunn/fzf')
  call dein#add('junegunn/fzf.vim')


  call dein#add('itchyny/lightline.vim')
  call dein#add('machakann/vim-highlightedyank')
  call dein#add('andymass/vim-matchup')

  " Language Integrations
  call dein#add('mrk21/yaml-vim')
  call dein#add('WolfgangMehner/bash-support')
  call dein#add('cespare/vim-toml')
  call dein#add('lifepillar/pgsql.vim')

  call dein#add('neoclide/coc.nvim', { 'merged': 0 })
  " call dein#add('rust-lang/rust.vim')

  " Grammar and Spell checking
  call dein#add('rhysd/vim-grammarous')


  " Required:
  call dein#end()
  call dein#save_state()
endif
" Install plugins on startup.
if dein#check_install()
  call dein#install()
endif
"End dein Scripts-------------------------

" Rust
let g:rustfmt_autosave = 1
let g:rustfmt_emit_files = 1
let g:rustfmt_fail_silently = 0
let g:rust_clip_command = 'xclip -selection clipboard'

" ==============
" Editor Settings
" ===============
filetype plugin indent on
set autoindent
set timeoutlen=300 " http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
set encoding=utf-8
set scrolloff=2
set noshowmode
set hidden
set nowrap
set nojoinspaces
let g:sneak#s_next = 1
let g:vim_markdown_new_list_item_indent = 0
let g:vim_markdown_auto_insert_bullets = 0
let g:vim_markdown_frontmatter = 1
" Always draw sign column. Prevent buffer moving when adding/deleting sign.
set signcolumn=yes

" Sane splits
set splitright
set splitbelow
" Permanent undo
set undodir=~/.vimdid
set undofile
" Wildmenu (command line completion) (:e <Tab>)
set wildmenu
set wildmode=list:longest
set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor
" Proper search
set incsearch
set ignorecase
set smartcase
set gdefault

" Bottom Command Bar
set cmdheight=2
set updatetime=300



if has('nvim')
    set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
    set inccommand=nosplit
    noremap <C-q> :confirm qall<CR>
end

set nowrap

set scrolloff=5

"""
""" COC-SETTINGS
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 'Smart' navigation
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-.> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>

" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>

" Implement methods for trait
nnoremap <silent> <space>i  :call CocActionAsync('codeAction', '', 'Implement missing members')<cr>

" Show actions available at this location
nnoremap <silent> <space>a  :CocAction<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"
"QUICK ACCESS
" Quicksave with leader
nmap <leader>w :w<CR>
" Esc is cancer.... remap
nnoremap <C-j> <Esc>
inoremap <C-j> <Esc>
vnoremap <C-j> <Esc>
snoremap <C-j> <Esc>
xnoremap <C-j> <Esc>
cnoremap <C-j> <C-c>
onoremap <C-j> <Esc>
lnoremap <C-j> <Esc>
tnoremap <C-j> <Esc>

nnoremap <C-k> <Esc>
inoremap <C-k> <Esc>
vnoremap <C-k> <Esc>
snoremap <C-k> <Esc>
xnoremap <C-k> <Esc>
cnoremap <C-k> <C-c>
onoremap <C-k> <Esc>
lnoremap <C-k> <Esc>
tnoremap <C-k> <Esc>
" Ctrl+h to stop searching
vnoremap <C-h> :nohlsearch<cr>
nnoremap <C-h> :nohlsearch<cr>
" No arrow keys --- force yourself to use the home row
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

nnoremap <leader><leader> <c-^>

""" Fix Popup Menu (of coc for gruvbox scheme)
highlight Pmenu ctermfg=255
highlight Pmenu ctermbg=234
highlight LineNr ctermfg=94

highlight Signcolumn ctermbg=234
highlight LineNr ctermbg=234
highlight CursorLineNr ctermbg=234

highlight CocWarningSign ctermbg=234
highlight CocWarningSign ctermfg=3
highlight CocInfoSign ctermfg=6
highlight CocHintSign ctermfg=12
highlight CocErrorSign ctermbg=9

" Limelight and Goyo Integration and Color scheme
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_guifg = '#777777'
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!



""" Enable Hybrid Line Numbers (relative-prev, currentabsolute, relative-next)
set number relativenumber

""" Enable FZF (Control-F)
set rtp+=~/.fzf
nnoremap <C-f> :FZF<CR>
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-h': 'split',
  \ 'ctrl-v': 'vsplit' }

""" Auto close Brackets
inoremap { {}<left>
inoremap [ []<left>
inoremap ( ()<left>

