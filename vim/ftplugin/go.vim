set shiftwidth=8
set softtabstop=8
set noexpandtab
set nolist

map <C-UP> :GoDef<CR>
nnoremap <Leader>d :GoDoc<CR>

"Fast build and test running
nnoremap <Leader>b :!make check<CR>
