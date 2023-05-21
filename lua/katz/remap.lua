vim.g.mapleader = " "

-- buffer navigation
vim.keymap.set("n", "<Leader>j", ":bprevious<CR>")
vim.keymap.set("n", "<Leader>k", ":bnext<CR>")
vim.keymap.set("n", "<Leader>c", ":bd<CR>")

-- avoid navigating with cursors
vim.keymap.set("n", "<RIGHT>", "<C-w>l")
vim.keymap.set("n", "<LEFT>", "<C-w>h")
vim.keymap.set("n", "<UP>", "<C-w>k")
vim.keymap.set("n", "<DOWN>", "<C-w>j")

-- quick substitution
vim.keymap.set("n", "<Leader>s", "yiw:%s,<C-r>\"")

-- easier integration with system clipboard
vim.api.nvim_set_option("clipboard", "unnamedplus")
