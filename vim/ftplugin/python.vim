"vimgrep word under cursor
nnoremap <Leader>g yiw:vimgrep /<C-r>"/g **/*.py

"Fast build and test running
nnoremap <Leader>b :make check<CR>
