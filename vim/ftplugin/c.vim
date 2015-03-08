"Load CTags for current dir
nmap <silent> <F5> :!ctags -R <CR>

"Move faster on CTags
map <C-LEFT> :tp<CR> 
map <C-RIGHT> :tn<CR>
map <C-UP> <C-]>
map <C-DOWN> <C-t>

"Fast build and test running
nnoremap <Leader>b :make check<CR>
