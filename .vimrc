syntax on
filetype plugin indent on
colo desert
set number    " Display Line numbers
set t_Co=256  " 256 colors
set hlsearch  " higlight search
set hidden    " let switch between buffers

"Tabs & spaces
set encoding=utf-8
set list listchars=tab:◀\ ,trail:■
set expandtab   " Tabs to spaces
set tabstop=2   " Tab = two space
set shiftwidth=2
set cursorline  " Horizontal line
set backspace=2 " make backspace work

"Airline
set noshowmode
set laststatus=2
let g:airline#extensions#tabline#enabled=1
let g:airline_theme='wombat'
set ttimeoutlen=10

"FZF
set rtp+=~/.fzf
