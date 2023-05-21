require("katz.plugins")
require("katz.remap")

vim.opt.guicursor = ""

vim.opt.nu = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false

vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.cmd('set termguicolors')

local colorscheme = 'gruvbox'

-- Check if the colorscheme file exists
if vim.fn.exists('colors/' .. colorscheme .. '.vim') == 1 then
    -- Set the colorscheme
    vim.cmd('colorscheme ' .. colorscheme)
end
