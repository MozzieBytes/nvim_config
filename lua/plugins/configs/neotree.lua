return {
	"nvim-neo-tree/neo-tree.nvim",
	lazy = true,
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
		"3rd/image.nvim",
	},
	keys = {
		{ "<leader>fe", "<cmd> Neotree toggle<CR>", desc = "NeoTree Toggle", mode = { "n", "v" } },
	},
	config = function()
		require("neo-tree").setup({
			window = {
				position = "right",
			},
			event_handlers = {
				{
					event = "file_opened",
					handler = function(_)
						require("neo-tree.command").execute({ action = "close" })
					end,
				},
			},
		})
	end,
}
