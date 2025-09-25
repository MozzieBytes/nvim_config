return {
	"David-Kunz/gen.nvim",
	dependencies = {
		"nvim-telescope/telescope.nvim",
	},
	cmd = "Gen",
	keys = {
		{ "<leader>]", ":Gen<CR>", desc = "Generate Code", mode = { "n", "v" } },
	},
	config = function()
		require("gen").setup({
			model = "qwen2.5-coder:3b",
			quit_map = "q",
			retry_map = "<C-r>",
			accept_map = "<C-CR>",
			host = "localhost",
			port = "11434",
			display_mode = "split",
			show_prompt = true,
			show_model = false,
			no_auto_close = true,
			init = nil,
			command = function(options)
				---@diagnostic disable-next-line: unused-local
				local body = { model = options.model, stream = true }
				return "curl --silent --no-buffer -X POST http://"
					.. options.host
					.. ":"
					.. options.port
					.. "/api/chat -d $body"
			end,
			debug = false,
		})
		require("gen").prompts["Generate_Code"] = {
			prompt = 'Generate code to match the following request: "$input". Only output the result in format ```$filetype\n...\n```:\n```$filetype\n$text\n```',
			replace = true,
			extract = "```$filetype\n(.-)```",
		}
	end,
}
