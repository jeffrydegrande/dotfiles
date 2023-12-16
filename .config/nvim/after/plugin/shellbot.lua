vim.api.nvim_create_user_command("ChatGPT", function()
	local has_shellbot, shellbot = pcall(require, "chatgpt")
	if not has_shellbot then
		vim.api.nvim.err_writeln("ChatGPT is not installed")
		return
	end
	if vim.env["SHELLBOT"] == nil then
		vim.api.nvim_err_writeln("SHELLBOT is not set")
		return
	end

	if vim.fn.executable(vim.env["SHELLBOT"]) ~= 1 then
		vim.api.nvim_err_writeln("SHELLBOT is not executable")
		return
	end
	shellbot.chatgpt()
end, {})
