vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- move visually selected text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- append next line to this one but keep cursor in same place
vim.keymap.set("n", "J", "mzJ`z")

-- pasted over item and deleted item goes to nowhere buffer
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- yank to system clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Q is a scary place
vim.keymap.set("n", "Q", "<nop>")

-- format buffer
vim.keymap.set("n", "<localleader>f", vim.lsp.buf.format)

-- replace word that cursor is on
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Resize with ctrl shift hjkl
vim.keymap.set("n", "<A-k>", ":resize -2<CR>")
vim.keymap.set("n", "<A-j>", ":resize +2<CR>")
vim.keymap.set("n", "<A-h>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<A-l>", ":vertical resize +2<CR>")

-- navigate buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>")
vim.keymap.set("n", "<S-h>", ":bprevious<CR>")

-- add diagnostics to quickfix list
vim.keymap.set("n", "<leader>qd", vim.diagnostic.setqflist)

-- add diagnostics to local list
vim.keymap.set("n", "<leader>ld", vim.diagnostic.setloclist)

-- add references to quickfix list
vim.keymap.set("n", "<leader>qr", vim.lsp.buf.references)

-- remap increment nums to avoid tmux leader conflict
vim.keymap.set("v", "g<C-b>", "g<C-a>")
