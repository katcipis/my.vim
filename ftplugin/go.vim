set shiftwidth=8
set softtabstop=8
set noexpandtab
set nolist

nnoremap <Leader>b :GoTest<CR>
nnoremap <Leader>r :GoRename<CR>
nnoremap <Leader>d :GoDoc<CR>
nnoremap <Leader>l :GoMetaLinter<CR>
nnoremap <Leader>i :GoInfo<CR>
nnoremap <Leader>a :GoAlternate<CR>
" how to do this ?
" vnoremap <Leader>x '<,'>GoExtract<CR>

"autocomplete on .
autocmd CompleteDone * pclose
" set completeopt=menu

let g:go_rename_command = "gopls"
let g:go_fmt_command = "goimports"
let g:go_metalinter_command = "golangci-lint"
let g:go_highlight_chan_whitespace_error = 1
let g:go_highlight_array_whitespace_error = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_types = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_format_strings = 1
let g:go_doc_popup_window = 1
