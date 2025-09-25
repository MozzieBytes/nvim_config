return {
	"ray-x/go.nvim",
	build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	event = { "BufReadPost" },
	dependencies = {
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
		"nvim-treesitter/nvim-treesitter",
		"theHamsta/nvim-dap-virtual-text",
		"rcarriga/nvim-dap-ui",
	},
	ft = { "go", "gomod" },
	opts = function()
		local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*.go",
			callback = function()
				require("go.format").goimports()
			end,
			group = format_sync_grp,
		})
	end,
	config = function()
		require("go").setup({
			lsp_keymaps = false,
		})

		vim.api.nvim_set_keymap("n", "<C-G>r", "<cmd>GoRun<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<C-G>b", "<cmd>GoBuild<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<C-G>l", "<cmd>GoLint<CR>", { noremap = true, silent = true })
		vim.api.nvim_set_keymap("n", "<C-G>t", "<cmd>GoTest<CR>", { noremap = true, silent = true })
	end,
}
