return {
	{ "nvim-lua/plenary.nvim" },
	{ "kdheepak/lazygit.nvim" },
	{
		"raghur/vim-ghost",
		build = ":lua GhostInstall",
	},
	{
		"jeffrydegrande/bundler-info.nvim",
		-- -- dir = "/home/jeffry/Code/Me/neovim_plugins/bundler-info.nvim",
		config = function()
			require("bundler-info").setup()
		end,
	},

	-- of course we want Mr. Pope's Goodies
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-rhubarb" },
	{ "tpope/vim-eunuch" },
	{ "tpope/vim-rails" },
	{ "gpanders/editorconfig.nvim" },
}
