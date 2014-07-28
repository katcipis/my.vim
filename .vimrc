" This must be first, because it changes other options as side effect
set nocompatible
set autoindent       " always set autoindenting on
set copyindent       " copy the previous indentation on autoindenting
set smarttab         " insert tabs on the start of a line according to shiftwidth, not tabstop
set undolevels=1000  " use many muchos levels of undo
set nobackup
set noswapfile
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.so
set is scs magic  "Opções de Busca
set history=10000 "Grava as últimas linhas do código
set nu "Numeração de linhas
set sm "Par de parênteses
set showcmd "Mostra comandos incompletos
set hlsearch "Prints searched words
set nocp
set hidden "Dont have to save changes on current buffer when opening new buffer
set showmode
set wildmenu
set wildmode=list:longest,full
set spell

" Had this problem on one of the dev envs: http://vim.wikia.com/wiki/Backspace_and_delete_problems
set backspace=2 " make backspace work like most other apps

"default indent settings
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

"Vundle Install
"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Generic plugins
Plugin 'tpope/vim-fugitive'
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'bling/vim-airline'
Plugin 'altercation/vim-colors-solarized'

" Javascript plugins
Plugin 'moll/vim-node'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'vim-scripts/JavaScript-Indent'

call vundle#end() " required

"display tabs and trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

" Get that filetype stuff happening
filetype on
filetype plugin on
filetype indent on

"matchit % magic
syntax on
runtime macros/matchit.vim

"Lets not work with arrows anymore :-)
nnoremap <UP> <Nop>
nnoremap <DOWN> <Nop>
nnoremap <LEFT> <Nop>
nnoremap <RIGHT> <Nop>
inoremap <UP> <Nop>
inoremap <DOWN> <Nop>
inoremap <LEFT> <Nop>
inoremap <RIGHT> <Nop>

"Load CTags for current dir
nmap <silent> <F5> :!ctags -R <CR>

"Move faster on CTags
map <C-LEFT> :tp<CR> 
map <C-RIGHT> :tn<CR>
map <C-UP> <C-]>
map <C-DOWN> <C-t>

" Press i to enter insert mode, and ii to exit.
imap ii <Esc>

"Easy paste from system clipboard
nnoremap <Leader>p "+p
nnoremap <Leader>P "+P

"Easy copy to system clipboard
vnoremap <Leader>y "+y
nnoremap <Leader>y "+y

"Fast Tab navigation 
nnoremap <Leader>j gT
nnoremap <Leader>k gt
nnoremap <Leader>t :tabnew 

"Fast quickfix navigation
nnoremap <Leader>n :cnext<CR>
nnoremap <Leader>N :cprev<CR>

"Disable highlighting for current search only
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

"Better spell checking
hi clear SpellBad
hi SpellBad cterm=underline

"Indent entire file
nnoremap <Leader>= mmgg=G'mzz

"Substitute word under cursor
nnoremap <Leader>s yiw:%s,<C-r>",

"vimgrep word under cursor
nnoremap <Leader>g yiw:vimgrep /<C-r>"/g 

"Tabularize fun :-)
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a: :Tabularize /:<CR>
vmap <Leader>a: :Tabularize /:<CR>


" vim-airline
if filereadable(expand("~/.vim/bundle/vim-airline/plugin/airline.vim"))
    set laststatus=2                                   " required for vim-airline
    let g:airline#extensions#tabline#enabled = 1
    let g:airline_theme = 'solarized'
    let g:airline_left_sep='›'                         " Slightly fancier than '>'
    let g:airline_right_sep='‹'                        " Slightly fancier than '<'
endif
