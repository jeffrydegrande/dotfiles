-- return {
--
-- 	{
-- 		"ellisonleao/gruvbox.nvim",
-- 		priority = 1000,
-- 		config = function()
-- 			vim.cmd("colorscheme gruvbox")
-- 		end,
-- 	},
-- }
-- return {
-- 	"folke/tokyonight.nvim",
-- 	priority = 1000,
-- 	opts = { style = "moon" }, -- moon, day, night, storm
-- 	config = function()
-- 		vim.cmd("colorscheme tokyonight-moon")
-- 	end,
-- }

return {
	"shaunsingh/nord.nvim",
	priority = 1000,
	config = function()
		vim.cmd("colorscheme nord")
	end,
}
