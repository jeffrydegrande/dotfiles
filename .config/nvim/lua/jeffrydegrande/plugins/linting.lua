return {
	"mfussenegger/nvim-lint",
	lazy = true,
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local lint = require("lint")

		lint.linters_by_ft = {
			typescript = { "eslint" },
			typescriptreact = { "eslint" },
			javascript = { "eslint" },
			javascriptreact = { "eslint" },
			lua = { "luacheck" },
			python = { "flake8" },
			sh = { "shellcheck" },
			markdown = { "markdownlint" },
			yaml = { "yamllint" },
			json = { "jsonlint" },
			vim = { "vint" },
			rust = { "cargo" },
			go = { "golangcilint" },
			ruby = { "rubocop" },
		}

		local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

		vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
			group = lint_augroup,
			callback = function()
				lint.try_lint()
			end,
		})

		vim.keymap.set("n", "<leader>ql", function()
			lint.try_lint()
		end, { desc = "Trigger linting for current file" })
	end,
}
