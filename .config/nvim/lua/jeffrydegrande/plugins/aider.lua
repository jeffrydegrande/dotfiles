return {
	"joshuavial/aider.nvim",
	opts = {
		default_bindings = false,
	},

	keys = function()
		return {
			{
				"<leader>ao",
				'<cmd>lua AiderOpen("--sonnet")<cr>i',
				desc = "Aider Open",
			},
		}
	end,
}
