local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>l', builtin.live_grep, {})
vim.keymap.set('n', '<leader>le', builtin.buffers, {})
vim.keymap.set('n', '<leader>lf', builtin.help_tags, {})
vim.keymap.set('n', '<leader>g', ':Ex<CR>', {})
vim.keymap.set('n', '<leader>n', ':bd<CR>', {})
vim.keymap.set('n', '<leader>e', vim.lsp.buf.hover, {})
vim.keymap.set('n', '<leader>a', vim.lsp.buf.code_action, {})

