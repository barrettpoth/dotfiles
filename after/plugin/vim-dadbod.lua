vim.keymap.set({"n","v"}, "<C-Enter>", "<Plug>(DBUI_ExecuteQuery)")
vim.keymap.set("n", "<leader>db", vim.cmd.DBUIToggle)
