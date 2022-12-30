vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- move visually selected text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- append next line to this one but keep cursor in same place
vim.keymap.set("n", "J", "mzJ`z")

-- don't highlight search term after selected
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

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

-- Better window navigation
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Resize with arrows
vim.keymap.set("n", "<C-S-k>", ":resize -2<CR>")
vim.keymap.set("n", "<C-S-j>", ":resize +2<CR>")
vim.keymap.set("n", "<C-S-h>", ":vertical resize -2<CR>")
vim.keymap.set("n", "<C-S-l>", ":vertical resize +2<CR>")

-- Navigate buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>")
vim.keymap.set("n", "<S-h>", ":bprevious<CR>")

-- add diagnostics to quickfix list
vim.keymap.set("n", "<leader>qd", vim.diagnostic.setqflist)

-- add diagnostics to local list
vim.keymap.set("n", "<leader>ld", vim.diagnostic.setloclist)

-- add references to quickfix list
vim.keymap.set("n", "<leader>qr", vim.lsp.buf.references)
