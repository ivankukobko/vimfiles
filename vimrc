set nocompatible 		" Vim is better than Vi, True story

filetype off 			" force reloading after pathogen loaded
call pathogen#infect()
call pathogen#helptags()
filetype plugin indent on	" now enabling detection, plugins and indentation
syntax on


set number
set showmatch
set showmode
set mouse=a             " enabling mouse, if terminal supports it

" Search options
set ignorecase
set smartcase
set hlsearch
set incsearch

" Indent options
set autoindent
set copyindent
set expandtab

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

" Remap j and k to act as expected when used on long, wrapped, lines
nnoremap j gj
nnoremap k gk

" Easy window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
nnoremap <leader>w <C-w>v<C-w>l

if has("gui_running")
        " Disable scrollbars and toolbars
        set guioptions-=m
        set guioptions-=T
        set guioptions-=l
        set guioptions-=L
        set guioptions-=r
        set guioptions-=R

        colorscheme desert
else
        colorscheme darkblue    	
end
