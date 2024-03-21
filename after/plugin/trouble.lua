local trouble = require("trouble")

vim.keymap.set("n", "<leader>e", function() trouble.toggle() end)
vim.keymap.set("n", "<leader>ed", function() trouble.toggle("document_diagnostics") end)
vim.keymap.set("n", "<leader>eq", function() trouble.toggle("quickfix") end)
vim.keymap.set("n", "<leader>el", function() trouble.toggle("loclist") end)
vim.keymap.set("n", "<leader>er", function() require("trouble").toggle("lsp_references") end)
