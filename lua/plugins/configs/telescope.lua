return {
	"nvim-telescope/telescope.nvim",
	lazy = true,
	tag = "0.1.6",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"nvim-telescope/telescope-ui-select.nvim",
	},
	keys = {
		{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Find Files", mode = "n" },
		{ "<leader>fg", "<cmd>Telescope live_grep<CR>", desc = "Live Grep", mode = "n" },
		{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "View Buffers", mode = "n" },
		{ "<leader>fh", "<cmd>Telescope help_tags<CR>", desc = "Help Tags", mode = "n" },
	},
	config = function()
		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						["<C-h>"] = "which_key",
					},
				},
				initial_mode = "normal",
			},
			pickers = {},
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
		})
		require("telescope").load_extension("ui-select")
	end,
}
