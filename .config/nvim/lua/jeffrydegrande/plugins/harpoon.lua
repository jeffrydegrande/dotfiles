return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	-- dir = "~/Code/Me/harpoon",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local harpoon = require("harpoon")
		local keymap = vim.keymap

		harpoon:setup()

		keymap.set("n", "<leader>a", function()
			harpoon:list():append()
		end, { desc = "Append current file to harpoon" })

		keymap.set("n", "<leader>l", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Toggle harpoon menu" })

		keymap.set("n", "<leader>1", function()
			harpoon:list():select(1)
		end)

		keymap.set("n", "<leader>2", function()
			harpoon:list():select(2)
		end)

		keymap.set("n", "<leader>3", function()
			harpoon:list():select(3)
		end)

		keymap.set("n", "<leader>4", function()
			harpoon:list():select(4)
		end)
	end,
}
