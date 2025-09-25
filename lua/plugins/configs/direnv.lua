return {
	"actionshrimp/direnv.nvim",
	opts = {
		async = true,
		on_direnv_finished = function()
			vim.cmd("LspStart")
		end,
	},
}
