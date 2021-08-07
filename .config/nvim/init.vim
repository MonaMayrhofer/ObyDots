" I want my stuff to mainly be in lua but sometimes a little vimscript does not hurt
" init.vim loads lua/init.lua and then does quick and dirty hacks.
lua require('init')

" I do not want to pile things here. Move them to lua files as soon as possible.

let s:tern = {}
let s:tern.dark0           = ['#282828', 235]
let s:tern.dark1           = ['#41403f', 237]
let s:tern.dark2           = ['#4d4c4b', 239]
let s:tern.dark3           = ['#595756', 241]
let s:tern.dark4           = ['#716e6d', 243]
let s:tern.light0          = ['#f9f5f0', 243]
let s:tern.light1      	   = ['#eae1df', 243]
let s:tern.light2      	   = ['#bab3b2', 243]
let s:tern.light3      	   = ['#a29c9b', 243]
let s:tern.light4      	   = ['#898584', 243]

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

let s:bold = 'bold'
let s:italic = 'italic'
let s:underline = 'underline'
let s:undercurl = 'undercurl'
let s:inverse = 'inverse'
let s:vim_bg = ['bg', 'bg']
let s:vim_fg = ['fg', 'fg']
let s:none = ['NONE', 'NONE']

let s:bg0 = s:tern.dark0
let s:bg1 = s:tern.dark1
let s:bg2 = s:tern.dark2
let s:bg3 = s:tern.dark3
let s:bg4 = s:tern.dark4
