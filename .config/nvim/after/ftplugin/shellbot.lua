vim.bo.textwidth = 0
vim.wo.list = false
vim.wo.number = false
vim.wo.relativenumber = false
vim.wo.showbreak = "NONE"

local has_shellbot = require("chatgpt")

if has_shellbot then
	print("ChatGPT loaded")
	vim.keymap.set("n", "<leader>c", ":ChatGPT<cr>")
	vim.keymap.set({ "i", "n" }, "<M-Return>", ChatGPTSubmit, { buffer = true })
else
	print("ChatGPT not loaded")
end
