local Job = require("plenary.job")

local M = {}

local get_file_path = function()
	return vim.api.nvim_buf_get_name(0)
end

local chezmoi_add = function()
	Job:new({ command = "chezmoi", args = { "add", "--force", get_file_path() } }):sync()
end

local chezmoi_apply = function()
	Job:new({ command = "chezmoi", args = { "apply", "--force", get_file_path() } }):sync()
	vim.api.nvim_cmd({ cmd = "edit" }, {})
end

local chezmoi_diff = function()
	local job = Job:new({ command = "chezmoi", args = { "diff", get_file_path() } })
	job:sync()
	print(table.concat(job:result(), "\n"))
end

local chezmoi_edit = function()
	local job = Job:new({ command = "chezmoi", args = { "source-path", get_file_path() } })
	job:sync()
	vim.api.nvim_cmd({ cmd = "edit", args = job:result() }, {})
end

local chezmoi_remove = function()
	Job:new({ command = "chezmoi", args = { "remove", "--force", get_file_path() } }):sync()
end

function M.setup()
	vim.api.nvim_create_user_command("ChezmoiAdd", chezmoi_add, {})
	vim.api.nvim_create_user_command("ChezmoiApply", chezmoi_apply, {})
	vim.api.nvim_create_user_command("ChezmoiDiff", chezmoi_diff, {})
	vim.api.nvim_create_user_command("ChezmoiEdit", chezmoi_edit, {})
	vim.api.nvim_create_user_command("ChezmoiRemove", chezmoi_remove, {})
end

return M
