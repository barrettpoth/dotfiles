require("telescope").setup {
    pickers = {
        lsp_references = {
            include_declaration = false,
            show_line = false,
        },
        lsp_definitions = {
            include_declaration = false,
            show_line = false,
        }
    }
}

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>f', builtin.find_files, {})
vim.keymap.set('n', '<leader>gg', builtin.live_grep, {})

vim.keymap.set('n', '<leader>gs', builtin.git_status, {})
vim.keymap.set('n', '<leader>gl', builtin.git_commits, {})
vim.keymap.set('n', '<leader>gbl', builtin.git_bcommits, {})
vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})

vim.keymap.set('n', '<leader>tm', ":Telescope tmux sessions<CR>", {})
