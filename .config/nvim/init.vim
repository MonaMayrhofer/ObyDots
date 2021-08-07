" I want my stuff to mainly be in lua but sometimes a little vimscript does not hurt
" init.vim loads lua/init.lua and then does quick and dirty hacks.
lua require('init')

" I do not want to pile things here. Move them to lua files as soon as possible.

let s:tern = {}
let s:tern.dark0           = ['#282828', 235]
let s:tern.dark1           = ['#32312f', 237]
let s:tern.dark2           = ['#3d3b39', 239]
let s:tern.dark3           = ['#4d4b4a', 241]
let s:tern.dark4           = ['#555251', 243]
let s:tern.gray            = ['#7c7673', 000]
let s:tern.light0          = ['#f9f5f0', 243]
let s:tern.light1      	   = ['#e7dddb', 243]
let s:tern.light2      	   = ['#cebdba', 243]
let s:tern.light3      	   = ['#b2a2a0', 243]
let s:tern.light4      	   = ['#9b8e8b', 243]

let s:tern.bright_red      = ['#ED7E7A', 167]
let s:tern.bright_green    = ['#B2CE81', 142]
let s:tern.bright_yellow   = ['#F5F062', 214]
let s:tern.bright_blue     = ['#0BADCD', 109]
let s:tern.bright_purple   = ['#B181D6', 175]
let s:tern.bright_aqua     = ['#62B3A0', 108]
let s:tern.bright_orange   = ['#D4A287', 208] 

let s:tern.neutral_red     = ['#F0544F', 167]
let s:tern.neutral_green   = ['#A0C75C', 142]
let s:tern.neutral_yellow  = ['#FCF431', 214]
let s:tern.neutral_blue    = ['#007991', 109]
let s:tern.neutral_purple  = ['#9D59D2', 175]
let s:tern.neutral_aqua    = ['#439A86', 108]
let s:tern.neutral_orange  = ['#CE8964', 208]

let s:tern.dim_red       = ['#dd241e',  88]
let s:tern.dim_green     = ['#7fa33f', 100]
let s:tern.dim_yellow    = ['#ddd60e', 136]
let s:tern.dim_blue      = ['#06596a',  24]
let s:tern.dim_purple    = ['#7d3ab1',  96]
let s:tern.dim_aqua      = ['#387365',  66]
let s:tern.dim_orange    = ['#af673f', 130]


" Setup Emphasis: {{{
let s:bold = 'bold,'
let s:italic = 'italic,'
let s:underline = 'underline,'
let s:undercurl = 'undercurl,'
let s:inverse = 'inverse,'
" }}}

let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none = ['NONE', 'NONE']

let s:bg0 = s:tern.dark0
let s:bg1 = s:tern.dark1
let s:bg2 = s:tern.dark2
let s:bg3 = s:tern.dark3
let s:bg4 = s:tern.dark4

let s:gray = s:tern.gray

let s:fg0 = s:tern.light0
let s:fg1 = s:tern.light1
let s:fg2 = s:tern.light2
let s:fg3 = s:tern.light3
let s:fg4 = s:tern.light4

let s:red = s:tern.neutral_red
let s:green = s:tern.neutral_green
let s:yellow = s:tern.neutral_yellow
let s:blue = s:tern.neutral_blue
let s:purple = s:tern.neutral_purple
let s:aqua = s:tern.neutral_aqua
let s:orange = s:tern.neutral_orange

if !exists('g:ternary_termcolors')
  let g:ternary_termcolors=256
endif
if g:ternary_termcolors == 16
  let s:bg0[1]    = 0
  let s:fg4[1]    = 7
  let s:gray[1]   = 8
  let s:red[1]    = 9
  let s:green[1]  = 10
  let s:yellow[1] = 11
  let s:blue[1]   = 12
  let s:purple[1] = 13
  let s:aqua[1]   = 14
  let s:fg1[1]    = 15
endif

" save current relative colors back to palette dictionary
let s:tern.bg0 = s:bg0
let s:tern.bg1 = s:bg1
let s:tern.bg2 = s:bg2
let s:tern.bg3 = s:bg3
let s:tern.bg4 = s:bg4

let s:tern.gray = s:gray

let s:tern.fg0 = s:fg0
let s:tern.fg1 = s:fg1
let s:tern.fg2 = s:fg2
let s:tern.fg3 = s:fg3
let s:tern.fg4 = s:fg4

let s:tern.red    = s:red
let s:tern.green  = s:green
let s:tern.yellow = s:yellow
let s:tern.blue   = s:blue
let s:tern.purple = s:purple
let s:tern.aqua   = s:aqua
let s:tern.orange = s:orange
" }}}


" termcolors for nvim
if has('nvim')
  let g:terminal_color_0 = s:bg0[0]
  let g:terminal_color_8 = s:gray[0]

  let g:terminal_color_1 = s:tern.neutral_red[0]
  let g:terminal_color_9 = s:red[0]

  let g:terminal_color_2 = s:tern.neutral_green[0]
  let g:terminal_color_10 = s:green[0]

  let g:terminal_color_3 = s:tern.neutral_yellow[0]
  let g:terminal_color_11 = s:yellow[0]

  let g:terminal_color_4 = s:tern.neutral_blue[0]
  let g:terminal_color_12 = s:blue[0]

  let g:terminal_color_5 = s:tern.neutral_purple[0]
  let g:terminal_color_13 = s:purple[0]

  let g:terminal_color_6 = s:tern.neutral_aqua[0]
  let g:terminal_color_14 = s:aqua[0]

  let g:terminal_color_7 = s:fg4[0]
  let g:terminal_color_15 = s:fg1[0]
endif




" Stolen from ternary
" Overload Parameters

let s:is_dark = 'dark'

let s:hls_cursor = s:orange
if exists('g:ternary_hls_cursor')
  let s:hls_cursor = get(s:gb, g:ternary_hls_cursor)
endif

let s:number_column = s:none
if exists('g:ternary_number_column')
  let s:number_column = get(s:gb, g:ternary_number_column)
endif

let s:sign_column = s:bg1

if exists('g:gitgutter_override_sign_column_highlight') &&
      \ g:gitgutter_override_sign_column_highlight == 1
  let s:sign_column = s:number_column
else
  let g:gitgutter_override_sign_column_highlight = 0

  if exists('g:ternary_sign_column')
    let s:sign_column = get(s:gb, g:ternary_sign_column)
  endif
endif

let s:color_column = s:bg1
if exists('g:ternary_color_column')
  let s:color_column = get(s:gb, g:ternary_color_column)
endif

let s:vert_split = s:bg0
if exists('g:ternary_vert_split')
  let s:vert_split = get(s:gb, g:ternary_vert_split)
endif

let s:invert_signs = ''
if exists('g:ternary_invert_signs')
  if g:ternary_invert_signs == 1
    let s:invert_signs = s:inverse
  endif
endif

let s:invert_selection = s:inverse
if exists('g:ternary_invert_selection')
  if g:ternary_invert_selection == 0
    let s:invert_selection = ''
  endif
endif

let s:invert_tabline = ''
if exists('g:ternary_invert_tabline')
  if g:ternary_invert_tabline == 1
    let s:invert_tabline = s:inverse
  endif
endif

let s:italicize_comments = s:italic
if exists('g:ternary_italicize_comments')
  if g:ternary_italicize_comments == 0
    let s:italicize_comments = ''
  endif
endif

let s:italicize_strings = ''
if exists('g:ternary_italicize_strings')
  if g:ternary_italicize_strings == 1
    let s:italicize_strings = s:italic
  endif
endif

if !exists('g:ternary_improved_strings')
  let g:ternary_improved_strings=0
endif

if !exists('g:ternary_improved_warnings')
  let g:ternary_improved_warnings=0
endif

if !exists('g:ternary_guisp_fallback') || index(['fg', 'bg'], g:ternary_guisp_fallback) == -1
  let g:ternary_guisp_fallback='NONE'
endif


" Stolen from gruvbox, not quite sure what this does...
" Highlighting Function: {{{
function! s:HL(group, fg, ...)
  " Arguments: group, guifg, guibg, gui, guisp

  " foreground
  let fg = a:fg

  " background
  if a:0 >= 1
    let bg = a:1
  else
    let bg = s:none
  endif

  " emphasis
  if a:0 >= 2 && strlen(a:2)
    let emstr = a:2
  else
    let emstr = 'NONE,'
  endif

  " special fallback
  if a:0 >= 3
    if g:ternary_guisp_fallback != 'NONE'
      let fg = a:3
    endif

    " bg fallback mode should invert higlighting
    if g:ternary_guisp_fallback == 'bg'
      let emstr .= 'inverse,'
    endif
  endif

  let histring = [ 'hi', a:group,
        \ 'guifg=' . fg[0], 'ctermfg=' . fg[1],
        \ 'guibg=' . bg[0], 'ctermbg=' . bg[1],
        \ 'gui=' . emstr[:-1], 'cterm=' . emstr[:-1]
        \ ]

  " special
  if a:0 >= 3
    call add(histring, 'guisp=' . a:3[0])
  endif

  execute join(histring, ' ')
endfunction
" }}}


" memoize common hi groups
call s:HL('TernaryFg0', s:fg0)
call s:HL('TernaryFg1', s:fg1)
call s:HL('TernaryFg2', s:fg2)
call s:HL('TernaryFg3', s:fg3)
call s:HL('TernaryFg4', s:fg4)
call s:HL('TernaryGray', s:gray)
call s:HL('TernaryBg0', s:bg0)
call s:HL('TernaryBg1', s:bg1)
call s:HL('TernaryBg2', s:bg2)
call s:HL('TernaryBg3', s:bg3)
call s:HL('TernaryBg4', s:bg4)

call s:HL('TernaryRed', s:red)
call s:HL('TernaryRedBold', s:red, s:none, s:bold)
call s:HL('TernaryGreen', s:green)
call s:HL('TernaryGreenBold', s:green, s:none, s:bold)
call s:HL('TernaryYellow', s:yellow)
call s:HL('TernaryYellowBold', s:yellow, s:none, s:bold)
call s:HL('TernaryBlue', s:blue)
call s:HL('TernaryBlueBold', s:blue, s:none, s:bold)
call s:HL('TernaryPurple', s:purple)
call s:HL('TernaryPurpleBold', s:purple, s:none, s:bold)
call s:HL('TernaryAqua', s:aqua)
call s:HL('TernaryAquaBold', s:aqua, s:none, s:bold)
call s:HL('TernaryOrange', s:orange)
call s:HL('TernaryOrangeBold', s:orange, s:none, s:bold)

call s:HL('TernaryRedSign', s:red, s:sign_column, s:invert_signs)
call s:HL('TernaryGreenSign', s:green, s:sign_column, s:invert_signs)
call s:HL('TernaryYellowSign', s:yellow, s:sign_column, s:invert_signs)
call s:HL('TernaryBlueSign', s:blue, s:sign_column, s:invert_signs)
call s:HL('TernaryPurpleSign', s:purple, s:sign_column, s:invert_signs)
call s:HL('TernaryAquaSign', s:aqua, s:sign_column, s:invert_signs)
call s:HL('TernaryOrangeSign', s:orange, s:sign_column, s:invert_signs)
" }}}


" Vanilla colorscheme ---------------------------------------------------------
" General UI: {{{
" Normal text
call s:HL('Normal', s:fg1, s:bg0)

" Correct background (see issue #7):
" --- Problem with changing between dark and light on 256 color terminal
" --- https://github.com/morhetz/gruvbox/issues/7
if s:is_dark
  set background=dark
else
  set background=light
endif

if version >= 700
  " Screen line that the cursor is
  call s:HL('CursorLine',   s:none, s:bg1)
  " Screen column that the cursor is
  hi! link CursorColumn CursorLine

  " Tab pages line filler
  call s:HL('TabLineFill', s:bg4, s:bg1, s:invert_tabline)
  " Active tab page label
  call s:HL('TabLineSel', s:green, s:bg1, s:invert_tabline)
  " Not active tab page label
  hi! link TabLine TabLineFill

  " Match paired bracket under the cursor
  call s:HL('MatchParen', s:none, s:bg3, s:bold)
endif

if version >= 703
  " Highlighted screen columns
  call s:HL('ColorColumn',  s:none, s:color_column)

  " Concealed element: \lambda → λ
  call s:HL('Conceal', s:blue, s:none)

  " Line number of CursorLine
  call s:HL('CursorLineNr', s:yellow, s:bg1)
endif

hi! link NonText TernaryBg2
hi! link SpecialKey TernaryBg2

call s:HL('Visual',    s:none,  s:bg3, s:invert_selection)
hi! link VisualNOS Visual

call s:HL('Search',    s:yellow, s:bg0, s:inverse)
call s:HL('IncSearch', s:hls_cursor, s:bg0, s:inverse)

call s:HL('Underlined', s:blue, s:none, s:underline)

call s:HL('StatusLine',   s:bg2, s:fg1, s:inverse)
call s:HL('StatusLineNC', s:bg1, s:fg4, s:inverse)

" The column separating vertically split windows
call s:HL('VertSplit', s:bg3, s:vert_split)

" Current match in wildmenu completion
call s:HL('WildMenu', s:blue, s:bg2, s:bold)

" Directory names, special names in listing
hi! link Directory TernaryGreenBold

" Titles for output from :set all, :autocmd, etc.
hi! link Title TernaryGreenBold

" Error messages on the command line
call s:HL('ErrorMsg',   s:bg0, s:red, s:bold)
" More prompt: -- More --
hi! link MoreMsg TernaryYellowBold
" Current mode message: -- INSERT --
hi! link ModeMsg TernaryYellowBold
" 'Press enter' prompt and yes/no questions
hi! link Question TernaryOrangeBold
" Warning messages
hi! link WarningMsg TernaryRedBold
" }}}




" Gutter: {{{
" Line number for :number and :# commands
call s:HL('LineNr', s:bg4, s:number_column)

" Column where signs are displayed
call s:HL('SignColumn', s:none, s:sign_column)

" Line used for closed folds
call s:HL('Folded', s:gray, s:bg1, s:italic)
" Column where folds are displayed
call s:HL('FoldColumn', s:gray, s:bg1)

" }}}
" Cursor: {{{

" Character under cursor
call s:HL('Cursor', s:none, s:none, s:inverse)
" Visual mode cursor, selection
hi! link vCursor Cursor
" Input moder cursor
hi! link iCursor Cursor
" Language mapping cursor
hi! link lCursor Cursor

" }}}
" Syntax Highlighting: {{{

if g:ternary_improved_strings == 0
  hi! link Special TernaryOrange
else
  call s:HL('Special', s:orange, s:bg1, s:italicize_strings)
endif

call s:HL('Comment', s:gray, s:none, s:italicize_comments)
call s:HL('Todo', s:vim_fg, s:vim_bg, s:bold . s:italic)
call s:HL('Error', s:red, s:vim_bg, s:bold . s:inverse)

" Generic statement
hi! link Statement TernaryRed
" if, then, else, endif, swicth, etc.
hi! link Conditional TernaryRed
" for, do, while, etc.
hi! link Repeat TernaryRed
" case, default, etc.
hi! link Label TernaryRed
" try, catch, throw
hi! link Exception TernaryRed
" sizeof, "+", "*", etc.
hi! link Operator Normal
" Any other keyword
hi! link Keyword TernaryRed

" Variable name
hi! link Identifier TernaryBlue
" Function name
hi! link Function TernaryGreenBold

" Generic preprocessor
hi! link PreProc TernaryAqua
" Preprocessor #include
hi! link Include TernaryAqua
" Preprocessor #define
hi! link Define TernaryAqua
" Same as Define
hi! link Macro TernaryAqua
" Preprocessor #if, #else, #endif, etc.
hi! link PreCondit TernaryAqua

" Generic constant
hi! link Constant TernaryPurple
" Character constant: 'c', '/n'
hi! link Character TernaryPurple
" String constant: "this is a string"
if g:ternary_improved_strings == 0
  call s:HL('String',  s:green, s:none, s:italicize_strings)
else
  call s:HL('String',  s:fg1, s:bg1, s:italicize_strings)
endif
" Boolean constant: TRUE, false
hi! link Boolean TernaryPurple
" Number constant: 234, 0xff
hi! link Number TernaryPurple
" Floating point constant: 2.3e10
hi! link Float TernaryPurple

" Generic type
hi! link Type TernaryYellow
" static, register, volatile, etc
hi! link StorageClass TernaryOrange
" struct, union, enum, etc.
hi! link Structure TernaryAqua
" typedef
hi! link Typedef TernaryYellow

" }}}
" Completion Menu: {{{

if version >= 700
  " Popup menu: normal item
  call s:HL('Pmenu', s:fg1, s:bg2)
  " Popup menu: selected item
  call s:HL('PmenuSel', s:bg2, s:blue, s:bold)
  " Popup menu: scrollbar
  call s:HL('PmenuSbar', s:none, s:bg2)
  " Popup menu: scrollbar thumb
  call s:HL('PmenuThumb', s:none, s:bg4)
endif

" }}}
" Diffs: {{{

call s:HL('DiffDelete', s:red, s:bg0, s:inverse)
call s:HL('DiffAdd',    s:green, s:bg0, s:inverse)
"call s:HL('DiffChange', s:bg0, s:blue)
"call s:HL('DiffText',   s:bg0, s:yellow)

" Alternative setting
call s:HL('DiffChange', s:aqua, s:bg0, s:inverse)
call s:HL('DiffText',   s:yellow, s:bg0, s:inverse)

" }}}
" Spelling: {{{

if has("spell")
  " Not capitalised word, or compile warnings
  if g:ternary_improved_warnings == 0
    call s:HL('SpellCap',   s:none, s:none, s:undercurl, s:red)
  else
    call s:HL('SpellCap',   s:green, s:none, s:bold . s:italic)
  endif
  " Not recognized word
  call s:HL('SpellBad',   s:none, s:none, s:undercurl, s:blue)
  " Wrong spelling for selected region
  call s:HL('SpellLocal', s:none, s:none, s:undercurl, s:aqua)
  " Rare word
  call s:HL('SpellRare',  s:none, s:none, s:undercurl, s:purple)
endif

" }}}
