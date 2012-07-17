set nocompatible 		" Vim is better than Vi, True story

filetype off 			" force reloading after pathogen loaded
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on	" now enabling detection, plugins and indentation
syntax on


set number
set showmode
set mouse=a             " enabling mouse, if terminal supports it
set modelines=0

" Search options
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch                     " show matching brackets
nnoremap <leader><space> :noh<cr> " clear search highlight

" Indent options
set autoindent
set copyindent
set expandtab
set tabstop=4   " because 8 is too much
set shiftwidth=4
set softtabstop=4

" Handle long lines
set wrap linebreak nolist
set textwidth=79
set showbreak=…
"set formatoptions=qrn1
"set colorcolumn=85

" Don't keep swap and backup files
set nobackup
set noswapfile

set wildmenu
set wildmode=list:full

" Status line setup
set statusline=%f%M                       " Tail of the filename
set statusline+=%{fugitive#statusline()}  " fugitive-vim status
set statusline+=%=                        " left/right separator      
set statusline+=%c,                       " cursor column
set statusline+=%l/%L                     " cursor line/total lines
set statusline+=\ %P                      " percent through file
set laststatus=2

set cpoptions+=$

" Remap j and k to act as expected when used on long, wrapped, lines
nnoremap j gj
nnoremap k gk

" Learn not to use arrows in normal mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>

" Simple windows navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Make search use normal regexes
nnoremap / /\v
vnoremap / /\v

" Easy window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
nnoremap <leader>w <C-w>v<C-w>l   " split current window

" Map W to work too, when <S> is pressed accidentally
command W  w
command Wq wq
command Qa qa

set t_Co=256
if has("gui_running")
    " Moved everything from here to gvimrc
else
    colorscheme lucius 
end

" Sort properties in css declaration
nnoremap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" NERDTree keys
nnoremap <leader>p :NERDTreeToggle<CR>

" Ack search
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
nnoremap <leader>a :Ack<space>

" Opening CtrlP buffer search with separate command
nnoremap <C-b> :CtrlPBuffer<CR>
