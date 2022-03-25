"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" hide buffers instead of closing them. Preserves undo history
set hidden

" Set backspace config
set backspace=eol,start,indent  " allow backspacing over everything in insert mode
set whichwrap+=<,>,h,l

" Set pastetoggle key
set pastetoggle=<F3>

set ignorecase "Ignore case when searching
set smartcase  " ignore case if search pattern is all lowercase, case-sensitive otherwise

set hlsearch "Highlight search things

set incsearch "Make search act like search in modern browsers
set nolazyredraw "Don't redraw while executing macros 

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them
set mat=2 "How many tenths of a second to blink

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" line highlight
set cursorline
hi cursorline guibg=#333333 
hi CursorColumn guibg=#333333

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

syntax enable "Enable syntax hl

set gfn=Monospace\ 10
set shell=/bin/bash

set guioptions-=T
set guioptions-=m
set guioptions-=r
"Enable 256 colors
set t_Co=256
"enable 24bit true color
"set termguicolors
set background=dark
"set background=light
"colorscheme 
    "green: breeze, tabula
    "blue: navajo-night, nightVision, rigel
    "gray: nord, seoul256
colorscheme breeze
set nonu

set encoding=utf8

set ffs=unix,dos,mac "Default file types

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4   " number of spaces to use for autoindenting
set shiftround  " use multiple of shiftwidth when indenting with '<' and '>'
set tabstop=4   " a tab is four spaces
set smarttab    " insert tabs on the start of a line according to shiftwidth, not tabstop

set lbr
set tw=500

set autoindent "Auto indent
set copyindent    " copy the previous indentation on autoindenting
set wrap "Wrap lines
set number
set numberwidth=3
filetype plugin indent on

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" change <leader> to , instead of \, because not working on ubuntu
let mapleader=","

" Map space to / (search) and c-space to ? (backwards search)
map <space> /
"map <C-space> ?
nnoremap <leader><space> ?
"
" Added by Tim to map alt-left/right to flip through buffers
nmap <A-Left> :bp<CR>
nmap <A-Right> :bn<CR>

" show buffer list and await buffer # when invoking ,b
nnoremap <leader>b :ls<CR>:b

" go to closing tag (MatchTagAlways plugin) when invoking ,n
nnoremap <leader>n :MtaJumpToOtherTag<CR>

" close buffer but not split window when invoking ,d
nmap <leader>d :b#<bar>bd#<CR>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=indent
set foldignore=
set foldlevel=99
autocmd BufRead *.map source ~/.vim/map_fold.vim

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugins configuration
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open file explorer (:Vex, Sex) with tree style
let g:netrw_liststyle=3

" Macro para convertir qgis:sld a geonode:sld
" Se invoca con @s en modo de comando (cuando no se está editando)
" Nota: los símbolos ^M se insertan con ctrl-vm.
let @s=':%s/<NamedLayer/<sld:NamedLayer/g:%s/<UserStyle/<sld:UserStyle/g:%s/<StyledLayerDescriptor/<sld:StyledLayerDescriptor:%s/\/NamedLayer/\/sld:NamedLayer/g:%s/\/UserStyle/\/sld:UserStyle/g:%s/\/StyledLayerDescriptor/\/sld:StyledLayerDescriptor:%s/se:/sld:/g:%s/SvgParameter/CssParameter/g:g/Description/d'

" Macro para convertir el tag OnlineResource de qgis:sld a geonode:sld. 
" No se incluye en la macro @s por ser poco comun
" Se invoca con @o en modo de comando (cuando no se está editando)
let @o=':%s/OnlineResource/OnlineResource\ xmlns:xlink=\"http:\/\/www.w3.org\/1999\/xlink\"/g'
