return {
	"akinsho/toggleterm.nvim",
	lazy = true,
	branch = "main",
	cmd = { "ToggleTerm", "TermExec" },
	keys = {
		{ "<C-q>", "<cmd>ToggleTerm<CR>", desc = "Close Terminal", mode = "t" },
		{
			"<leader>tt",
			function()
				if DefaultTerm == nil then
					DefaultTerm = require("toggleterm.terminal").Terminal:new({
						display_name = "Term",
						direction = "float",
						auto_scroll = true,
					})
				end
				DefaultTerm:toggle()
			end,
			desc = "Toggle Terminal",
			mode = "n",
		},
		{
			"<leader>to",
			function()
				if OllamaTerm == nil then
					OllamaTerm = require("toggleterm.terminal").Terminal:new({
						display_name = "Ollama",
						cmd = "ollama_run",
						direction = "float",
						auto_scroll = true,
					})
				end
				OllamaTerm:toggle()
			end,
			desc = "Toggle Ollama Chat",
			mode = { "n", "v" },
		},
    {
      "<leader>tg",
      function()
        if GitTerm == nil then
          GitTerm = require("toggleterm.terminal").terminal:new({
            display_name = "LazyGit",
            cmd = "lazygit",
            direction = "float",
            auto_scroll = true,
          })
        end
        GitTerm:toggle()
      end,
      desc = "Toggle LazyGit",
      mode = "n",
    }
	},
	opts = {
		direction = "float",
		autochdir = true,
		persist_mode = true,
		start_in_insert = true,
		shell = vim.env.SHELL,
		winbar = {
			enabled = true,
			name_formatter = function(term)
				return term.name
			end,
		},
		size = function(term)
			if term.direction == "horizontal" then
				return 15
			elseif term.direction == "vertical" then
				return math.floor(vim.o.columns * 0.4)
			end
		end,
	},
	config = function(_, opts)
		require("toggleterm").setup(opts)
	end,
}
