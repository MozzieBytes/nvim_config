return {
	"kosayoda/nvim-lightbulb",
	event = "BufReadPre",
	enabled = true,
	opts = {
		autocmd = { enabled = true },
		priority = 10,
		hide_in_unfocused_buffer = true,
		action_kinds = {
			"source",
			"quickfix",
			"refactor",
		},
		sign = {
			enabled = true,
			text = "💡",
			hl = "LightBulbSign",
		},
		ignore = {
			actions_without_kind = true,
		},
	},
	config = function(_, opts)
		require("nvim-lightbulb").setup(opts)
	end,
}
