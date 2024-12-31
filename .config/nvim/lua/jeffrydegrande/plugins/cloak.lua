return {
	"laytan/cloak.nvim",
	config = function()
		require("cloak").setup({
			enabled = true,
			clock_character = "*",
			highlight_group = "Comment",
			patters = {
				{
					file_pattern = {
						".env*",
					},
					clock_pattern = "=.+",
				},
			},
		})
	end,
}
