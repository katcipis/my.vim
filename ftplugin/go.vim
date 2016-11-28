set shiftwidth=8
set softtabstop=8
set noexpandtab
set nolist

nmap <C-UP> gd
" Not working very well :-(
nmap <Leader>d <Plug>(go-doc)
nmap <Leader>i :GoImports<CR>
nmap <Leader>l :GoMetaLinter<CR>
nmap <Leader>r <Plug>(go-rename)
nmap <F5> <Plug>(go-coverage)

"vimgrep word under cursor
nnoremap <Leader>g yiw:vimgrep /<C-r>"/g **/*.go

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_interfaces = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

let g:go_list_type = "quickfix"
