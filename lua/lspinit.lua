-- loop over lsp directory and enable all language servers
local lsp_config_dir = vim.fn.expand("~/.config/nvim/lsp")
local handle = vim.loop.fs_scandir(lsp_config_dir)
if handle then
	while true do
		local name, type = vim.loop.fs_scandir_next(handle)
		if not name then
			break
		end
		if type == "file" and name:sub(-4) == ".lua" then
			local lsp_name = name:sub(1, -5)
			vim.lsp.enable(lsp_name)
		end
	end
end
