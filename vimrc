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

"Dont have to save changes on current buffer when opening new buffer
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

" Check if a colorscheme exists
" http://stackoverflow.com/a/5703164
function! HasColorScheme(scheme)
    let path = '~/.vim/bundle/vim-colorschemes/colors/' . a:scheme . '.vim'
    return filereadable(expand(path))
endfunction

"Vundle Install
"set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" plugins
Plugin 'tpope/vim-fugitive'
Plugin 'godlygeek/tabular'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-markdown'
Plugin 'gcmt/wildfire.vim'
Plugin 'flazz/vim-colorschemes'

" Hell yeah latex !!!
Plugin 'LaTeX-Box-Team/LaTeX-Box'

" Javascript plugins
Plugin 'moll/vim-node'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'vim-scripts/JavaScript-Indent'

" Scala stuff, for Gatling
Plugin 'derekwyatt/vim-scala'

call vundle#end() " required

"display tabs and trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

" Highlight only the lines that go past 120 characters
highlight ColorColumn ctermbg=green guibg=green
call matchadd('ColorColumn', '\%122v', 100)

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

"Fast buffer navigation 
nnoremap <Leader>j :bprevious<CR>
nnoremap <Leader>k :bnext<CR>
nnoremap <Leader>c :bd<CR>

"Fast nerdtree stuff :D
nnoremap <Leader>o :NERDTreeToggle<CR>

"If i get bored from nerdtree
nnoremap <Leader>t :edit 

"Fast quickfix navigation
nnoremap <Leader>n :cnext<CR>
nnoremap <Leader>nn :cprev<CR>

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

"Fast build and test running
nnoremap <Leader>b :make check<CR>

" vim-airline
if filereadable(expand("~/.vim/bundle/vim-airline/plugin/airline.vim"))
    set laststatus=2
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#tabline#fnamemod = ':t'
    let g:airline_enable_branch = 1
    let g:airline_enable_syntastic = 1
    let g:airline_powerline_fonts = 1
endif

" Syntastic Settings
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_signs = 1

" Must be loaded after the vim-colorschemes bundle
if HasColorScheme('wombat256mod')
    colorscheme wombat256mod
endif
