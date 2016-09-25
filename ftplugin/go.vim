set shiftwidth=8
set softtabstop=8
set noexpandtab
set nolist

nmap <C-UP> <Plug>(go-def-vertical)
" Not working very well :-(
"nmap <Leader>d <Plug>(go-doc-browser)
nmap <Leader>i :GoImports<CR>
nmap <Leader>l :GoMetaLinter<CR>
nmap <Leader>r :GoRename<CR>

"vimgrep word under cursor
nnoremap <Leader>g yiw:vimgrep /<C-r>"/g **/*.go

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
