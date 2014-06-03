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
set ts=4 "Seta aonde o tab para
set sw=4 "Número de colunas para ShiftWidth
set et "Espaços no lugar de tabulação
set showcmd "Mostra comandos incompletos
set hlsearch "Prints searched words
set nocp
set hidden "Dont have to save changes on current buffer when opening new buffer
set showmode
set wildmenu
set wildmode=list:longest,full
set spell
:match Error /\t/

" Get that filetype stuff happening
filetype on
filetype plugin on
filetype indent on

" Pathogen
execute pathogen#infect()

"More interesting stuff
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
