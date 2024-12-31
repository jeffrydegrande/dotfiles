vim.g.mapleader = " "

-- navigate buffers
vim.keymap.set("n", "<leader>x", "<cmd>bnext<cr>")
vim.keymap.set("n", "<leader>z", "<cmd>bprev<cr>")

-- navigate quickfix list
vim.keymap.set("n", "<M-n>", "<cmd>cnext<cr>")
vim.keymap.set("n", "<M-p>", "<cmd>cprev<cr>")

-- tmux sessionizer from inside vim <3
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- move lines up and down in visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
