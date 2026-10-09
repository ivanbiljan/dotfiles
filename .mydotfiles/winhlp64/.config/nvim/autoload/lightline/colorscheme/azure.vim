" ~/.config/nvim/autoload/lightline/colorscheme/azure.vim
" Blue lightline theme, agnoster-style solid arrows + thin subseparators
" Each section has its own bg so the arrows show the transitions:
"   [accent] > [bg2] > middle ... middle < [bg2] < [bg3] < [accent]

let s:blue   = ['#0a7aca', 32]
let s:dark   = ['#1a1a1a', 234]
let s:bg     = ['#1e1e1e', 234]
let s:bg2    = ['#2c2c2c', 236]
let s:bg3    = ['#3a3a3a', 237]
let s:fg     = ['#a8a8a8', 248]
let s:dim    = ['#5c5c5c', 241]
let s:green  = ['#4ec9b0', 79]
let s:purple = ['#c586c0', 176]
let s:orange = ['#ce9178', 174]
let s:red    = ['#f44747', 203]

let s:p = {'normal': {}, 'insert': {}, 'visual': {}, 'replace': {}, 'inactive': {}, 'tabline': {}}

" left:  [mode] [branch > filename]
" right: [lineinfo] [percent] [encoding < format < filetype]
function! s:mode_palette(accent) abort
  return {
        \ 'left':    [ [s:dark, a:accent, 'bold'], [a:accent, s:bg2] ],
        \ 'middle':  [ [s:fg, s:bg] ],
        \ 'right':   [ [s:dark, a:accent, 'bold'], [a:accent, s:bg3], [s:fg, s:bg2] ],
        \ 'error':   [ [s:red, s:bg] ],
        \ 'warning': [ [s:orange, s:bg] ],
        \ }
endfunction

let s:p.normal  = s:mode_palette(s:blue)
let s:p.insert  = s:mode_palette(s:green)
let s:p.visual  = s:mode_palette(s:purple)
let s:p.replace = s:mode_palette(s:red)

let s:p.inactive.left   = [ [s:dim, s:bg], [s:dim, s:bg] ]
let s:p.inactive.middle = [ [s:dim, s:bg] ]
let s:p.inactive.right  = [ [s:dim, s:bg], [s:dim, s:bg], [s:dim, s:bg] ]

let s:p.tabline.left   = [ [s:fg, s:bg2] ]
let s:p.tabline.tabsel = [ [s:dark, s:blue, 'bold'] ]
let s:p.tabline.middle = [ [s:fg, s:bg] ]
let s:p.tabline.right  = [ [s:dark, s:blue, 'bold'] ]

let g:lightline#colorscheme#azure#palette = lightline#colorscheme#flatten(s:p)
