return {
	{ "nvim-lua/plenary.nvim" },
	{ "kdheepak/lazygit.nvim" },
	{ "mbbill/undotree" },
	{
		"raghur/vim-ghost",
		build = ":lua GhostInstall",
	},

	-- of course we want Mr. Pope's Goodies
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-rhubarb" },
	{ "tpope/vim-eunuch" },
	{ "tpope/vim-rails" },
}
