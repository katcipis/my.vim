" This must be first, because it changes other options as side effect
set nocompatible
set autoindent
set copyindent
set smarttab
set undolevels=1000
set nobackup
set noswapfile
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.so
set is scs magic
set history=10000
set nu
set sm
set showcmd
set showmode
set wildmenu
set wildmode=list:longest,full

"Don't have to save changes on current buffer when opening new buffer
set hidden
"
"Prints searched words
set hlsearch

" Automatically re-read the file if it has changed
set autoread

" Had this problem on one of the dev envs: http://vim.wikia.com/wiki/Backspace_and_delete_problems
set backspace=2 " make backspace work like most other apps

"default indent settings
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" because macos
let mapleader='q'
let maplocalleader='\'

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"Align stuff
Plugin 'godlygeek/tabular'

"Comment code
Plugin 'scrooloose/nerdcommenter'

"Syntax correction
Plugin 'scrooloose/syntastic'

"markdown magic
Plugin 'tpope/vim-markdown'

"Extended object selection
Plugin 'gcmt/wildfire.vim'

"tagbar without airline
Plugin 'majutsushi/tagbar'

"Working with invisible stuff :-)
Plugin 'ntpeters/vim-better-whitespace'

"Add cool tabs for buffers
Plugin 'ap/vim-buftabline'

" Like airline, but smaller
Plugin 'itchyny/lightline.vim'

" JSON
Plugin 'elzr/vim-json'

" Hell yeah latex !!!
Plugin 'LaTeX-Box-Team/LaTeX-Box'

" Javascript plugins
Plugin 'jelera/vim-javascript-syntax'
Plugin 'vim-scripts/JavaScript-Indent'

" Scala stuff, for Gatling
Plugin 'derekwyatt/vim-scala'

" Lisp
Plugin 'kovisoft/slimv'

" Fuzzy file searching
Plugin 'ctrlpvim/ctrlp.vim'

call vundle#end()
filetype plugin indent on

"display tabs and trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

" Highlight only the lines that go past 80 characters
highlight ColorColumn ctermbg=green guibg=green
call matchadd('ColorColumn', '\%80v', 80)

"matchit % magic
syntax on
runtime macros/matchit.vim

"Lets not work with arrows anymore :-)
"Lets use the arrows to work with windows :D
nnoremap <RIGHT> <C-w>l
nnoremap <LEFT> <C-w>h
nnoremap <UP> <C-w>k
nnoremap <DOWN> <C-w>j

"Easy paste from system clipboard
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P

"Easy copy to system clipboard
vnoremap <Leader>y "+y
nnoremap <Leader>y "+y

"Fast buffer navigation
nnoremap <Leader>j :bprevious<CR>
nnoremap <Leader>k :bnext<CR>
nnoremap <Leader>c :bd<CR>

"Opening stuff :D
"nnoremap <Leader>t :edit
let g:ctrlp_map = '<Leader>t'

"Fast quickfix navigation
map <C-LEFT> :cprev<CR>
map <C-RIGHT> :cnext<CR>

"Disable highlighting for current search only
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

"Indent entire file
nnoremap <Leader>= mmgg=G'mzz

"Substitute word under cursor
nnoremap <Leader>s yiw:%s,<C-r>",

"vimgrep word under cursor
nnoremap <Leader>g yiw:vimgrep /<C-r>"/g **/*.suffix

"Tabularize fun :-)
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>

" Syntastic Settings
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_signs = 1

"Better spell checking
hi clear SpellBad
hi SpellBad cterm=underline
set spell

colorscheme gruvbox
set background=dark
