set shiftwidth=8
set softtabstop=8
set noexpandtab
set nolist

map <C-UP> :GoDef<CR>
nmap <Leader>d <Plug>(go-doc-vertical)
nmap <Leader>i :GoImports<CR>

"Fast build and test running
nmap <Leader>b :!make check<CR>

"vimgrep word under cursor
nnoremap <Leader>g yiw:vimgrep /<C-r>"/g **/*.go
