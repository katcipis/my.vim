set termguicolors
set autoindent
set copyindent
set smarttab
set undolevels=1000
set nobackup
set noswapfile
set wildignore=*.swp,*.bak,*.pyc,*.class,*.o,*.so
set history=10000
set nu
set showcmd
set showmode
filetype plugin on
syntax on

"Don't have to save changes on current buffer when opening new buffer
set hidden

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

"display tabs and trailing spaces
set list
set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

" Highlight only the lines that go past 80 characters
highlight ColorColumn ctermbg=green guibg=green
call matchadd('ColorColumn', '\%80v', 80)

"Lets not work with arrows anymore :-)
"Lets use the arrows to work with windows :D
nnoremap <RIGHT> <C-w>l
nnoremap <LEFT> <C-w>h
nnoremap <UP> <C-w>k
nnoremap <DOWN> <C-w>j

"Fast buffer navigation
nnoremap <Leader>j :bprevious<CR>
nnoremap <Leader>k :bnext<CR>
nnoremap <Leader>c :bd<CR>

"Opening stuff :D
nnoremap <Leader>t :edit

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

"open word under cursos on browser (default gx doesn't work properly...)
nmap gx yiW:!xdg-open <C-r>" &<CR>

"Better spell checking
hi clear SpellBad
hi SpellBad cterm=underline
set spell

"Better clipboard integration
set clipboard=unnamedplus

"colorscheme
" WHY: Crappy vim 8 true color stuff
" See: :h xterm-true-color
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

set background=dark
let g:gruvbox_italic=1
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1
let g:airline_theme='violet'
colorscheme gruvbox
