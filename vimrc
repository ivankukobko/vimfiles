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
set showmatch     " show matching brackets
set history=1000

" Indent options
set autoindent
set copyindent
set expandtab
set tabstop=4   " because 8 is too much
set shiftwidth=4
set softtabstop=4

" Handle long lines
set nowrap linebreak nolist
set textwidth=79
set showbreak=…

" Don't keep swap and backup files
set nobackup
set noswapfile

set wildmenu
set wildmode=list:full

" Status line setup
set laststatus=2
set statusline=\ %f%M%R\                     " Filename and flags
set statusline+=\ %{fugitive#statusline()}\  " fugitive-vim status
set statusline+=%=                           " left/right separator
set statusline+=\ [%c:%l/%L]\ %P\            " cursor line/column


set cpoptions+=$

" =========================================================================
" KEY MAPPINGS
" ========================================================================

" change the mapleader from \ to ,
let mapleader=","

" switch to paste mode, disabling all kinds of smartness
" and just pasting a whole buffer of text
set pastetoggle=<F2>

" Remap j and k to act as expected when used on long, wrapped, lines
nnoremap j gj
nnoremap k gk

" Learn not to use arrows in normal mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>

" Learn not to use arrows in visual mode
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>

"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>

" Simple windows navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>w <C-w>v<C-w>l     " split current window
map <leader>bd :Bclose<cr>          " Close current buffer

nnoremap <leader><space> :noh<cr>   " clear search highlight

" Make search use normal regexes
nnoremap / /\v
vnoremap / /\v

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Map W and Q to work too, when <S> is pressed accidentally
command W  w
command Wq wq
command Qa qa

set t_Co=256
set encoding=utf-8
if has("gui_running")
    " Moved everything from here to gvimrc
else
    colorscheme aldmeris
end

" Sort properties in css declaration
nmap <leader>S ?{<CR>jV/^\s*\}?$<CR>k:sort<CR>:noh<CR>

" =========================================================================
" PLUGINS
" ========================================================================

" NERDTree keys
nnoremap <leader>p :NERDTreeToggle<CR>

" Ack search
let g:ackprg="ack-grep -H --nocolor --nogroup --column"
nnoremap <leader>a :Ack<space>

" Opening CtrlP buffer search with separate command
nnoremap <C-b> :CtrlPBuffer<CR>

nnoremap <F5> :UndotreeToggle<cr>
" =========================================================================
" FUNCTIONS (STOLEN FROM THE INTERNETZ)
" ========================================================================

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! <SID>DeleteTrailingWS()
    exe "normal mz"
    %s/\s\+$//e
    exe "normal `z"
endfunc
autocmd BufWritePre * :call <SID>DeleteTrailingWS()

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
    let l:currentBufNum = bufnr("%")
    let l:alternateBufNum = bufnr("#")

    if buflisted(l:alternateBufNum)
        buffer #
    else
        bnext
    endif

    if bufnr("%") == l:currentBufNum
        new
    endif

    if buflisted(l:currentBufNum)
        execute("bdelete! ".l:currentBufNum)
    endif
endfunction
