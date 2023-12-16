return {
	"axkirillov/easypick.nvim",
	depends = { "nvim-telescope/telescope.nvim" },

	config = function()
		local easypick = require("easypick")

		easypick.setup({
			pickers = {
				{
					name = "changed_files",
					-- command = "git diff --name-only $(git merge-base HEAD master)",
					command = "git status -s | awk '{print $2}'",
					-- previewer = easypick.previewers.branch_diff({ base_branch = "master" }),
					previewer = easypick.previewers.default(),
				},
			},
		})
	end,
}
