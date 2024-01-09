vim.g.mapleader = " "

vim.keymap.set("n", "<leader>x", ":bn<cr>")
vim.keymap.set("n", "<leader>z", ":bp<cr>")

-- move lines up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- tmux sessionizer from inside vim <3
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
