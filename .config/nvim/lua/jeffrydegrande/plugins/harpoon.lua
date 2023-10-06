return {
	"ThePrimeagen/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local keymap = vim.keymap
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")

		keymap.set("n", "<leader>a", mark.add_file, { desc = "Mark file with harpoon" })
		keymap.set("n", "<leader>l", ui.toggle_quick_menu, { desc = "Toggle harpoon menu" })

		vim.keymap.set("n", "<leader>1", function()
			ui.nav_file(1)
		end)
		vim.keymap.set("n", "<leader>2", function()
			ui.nav_file(2)
		end)
		vim.keymap.set("n", "<leader>3", function()
			ui.nav_file(3)
		end)
		vim.keymap.set("n", "<leader>4", function()
			ui.nav_file(4)
		end)
	end,
}
