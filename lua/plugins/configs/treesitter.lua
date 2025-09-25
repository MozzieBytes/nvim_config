return {
	{
		"nvim-treesitter/nvim-treesitter",
		lazy = true,
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		config = function()
			local configs = require("nvim-treesitter.configs")

			---@type TSConfig
			---@diagnostic disable-next-line: missing-fields
			configs.setup({
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"vimdoc",
					"go",
					"terraform",
					"nix",
					"yaml",
				},
				sync_install = false,
				auto_install = false,
				ignore_install = {},
				highlight = { enable = true },
				indent = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
			})
		end,
	},
	{
		--- Stolen from josean-dev
		--- https://github.com/josean-dev/dev-environment-files/blob/main/.config/nvim/lua/josean/plugins/nvim-treesitter-text-objects.lua
		"nvim-treesitter/nvim-treesitter-textobjects",
		lazy = true,
		opts = {
			textobjects = {
				select = {
					enable = true,
					lookahead = true,
					keymaps = {
						["a="] = { query = "@assignment.outer", desc = "Select outer part of an assignment" },
						["i="] = { query = "@assignment.inner", desc = "Select inner part of an assignment" },
						["h="] = { query = "@assignment.lhs", desc = "Select left hand side part of an assignment" },
						["l="] = { query = "@assignment.rhs", desc = "Select right hand side part of an assignment" },

						["aa"] = { query = "@parameter.outer", "Select outer part of a parameter/argument" },
						["ia"] = { query = "@parameter.inner", "Select inner part of a parameter/argument" },

						["ai"] = { query = "@conditional.outer", "Select outer part of a conditional" },
						["ii"] = { query = "@conditional.inner", "Select inner part of a conditional" },

						["al"] = { query = "@loop.outer", "Select outer part of a loop" },
						["il"] = { query = "@loop.inner", "Select inner part of a loop" },

						["af"] = { query = "@call.outer", "Select outer part of a function call" },
						["if"] = { query = "@call.inner", "Select inner part of a function call" },

						["am"] = { query = "@function.outer", "Select outer part of a method/function definition" },
						["im"] = { query = "@function.inner", "Select inner part of a method/function definition" },

						["ac"] = { query = "@class.outer", "Select outer part of a class" },
						["ic"] = { query = "@class.inner", "Select inner part of a class" },
					},
				},
				swap = {
					enable = true,
					swap_next = {
						["<leader>na"] = "@parameter.inner", -- parameter/argument
						["<leader>nm"] = "@function.outer", -- function/method
					},
					swap_previous = {
						["<leader>pa"] = "@parameter.inner", -- parameter/argument
						["<leader>pm"] = "@function.outer", -- function/method
					},
				},
				move = {
					enable = false,
					set_jumps = true,
					goto_next_start = {
						["]f"] = { query = "@call.outer", desc = "Next function call start" },
						["]m"] = { query = "@function.outer", desc = "Next method/function def start" },
						["]c"] = { query = "@class.outer", desc = "Next class start" },
						["]i"] = { query = "@conditional.outer", desc = "Next conditional start" },
						["]l"] = { query = "@loop.outer", desc = "Next loop start" },
						["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
						["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
					},
					goto_next_end = {
						["]F"] = { query = "@call.outer", desc = "Next function call end" },
						["]M"] = { query = "@function.outer", desc = "Next method/function def end" },
						["]C"] = { query = "@class.outer", desc = "Next class end" },
						["]I"] = { query = "@conditional.outer", desc = "Next conditional end" },
						["]L"] = { query = "@loop.outer", desc = "Next loop end" },
					},
					goto_previous_start = {
						["[f"] = { query = "@call.outer", desc = "Prev function call start" },
						["[m"] = { query = "@function.outer", desc = "Prev method/function def start" },
						["[c"] = { query = "@class.outer", desc = "Prev class start" },
						["[i"] = { query = "@conditional.outer", desc = "Prev conditional start" },
						["[l"] = { query = "@loop.outer", desc = "Prev loop start" },
					},
					goto_previous_end = {
						["[F"] = { query = "@call.outer", desc = "Prev function call end" },
						["[M"] = { query = "@function.outer", desc = "Prev method/function def end" },
						["[C"] = { query = "@class.outer", desc = "Prev class end" },
						["[I"] = { query = "@conditional.outer", desc = "Prev conditional end" },
						["[L"] = { query = "@loop.outer", desc = "Prev loop end" },
					},
				},
			},
		},
		config = function(opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
	},
}
