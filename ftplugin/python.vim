"vim-jedi config
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>a"
let g:jedi#goto_definitions_command = "<C-UP>"
let g:jedi#documentation_command = "<leader>d"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"

"vimgrep word under cursor
nnoremap <Leader>g yiw:vimgrep /<C-r>"/g **/*.py

"Fast Debug breakpoint insertion
nnoremap <Leader>b Oimport pdb; pdb.set_trace()<Esc><CR>
