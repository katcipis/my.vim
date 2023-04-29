vim.g.mapleader = " "

-- buffer navigation
vim.keymap.set("n", "<Leader>j", ":bprevious<CR>")
vim.keymap.set("n", "<Leader>k", ":bnext<CR>")
vim.keymap.set("n", "<Leader>c", ":bd<CR>")

-- quick substitution
vim.keymap.set("n", "<Leader>s", "yiw:%s,<C-r>")

-- easier integration with system clipboard
vim.api.nvim_set_option("clipboard","unnamedplus")
