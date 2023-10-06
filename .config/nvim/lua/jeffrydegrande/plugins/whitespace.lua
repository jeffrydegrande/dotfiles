return {
	"johnfrankmorgan/whitespace.nvim",
	config = function()
		require("whitespace-nvim").setup({
			highlight = "DiffDelete",
			ignored_filetypes = { "TelescopePrompt", "Trouble", "help" },
		})

		vim.keymap.set("n", "<Leader>t", require("whitespace-nvim").trim, { desc = "Fix trailing whitespace" })
	end,
}
