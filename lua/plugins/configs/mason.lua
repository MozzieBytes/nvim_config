local P = {
	"williamboman/mason.nvim",
	lazy = false,
	dependencies = {
		-- DAP
		"mfussenegger/nvim-dap",
		"rcarriga/nvim-dap-ui",
		"jay-babu/mason-nvim-dap.nvim",
	},
}

P.config = function()
	require("mason").setup({
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	})

	require("mason-nvim-dap").setup({
		automatic_installation = false,
		ensure_installed = {
			"codelldb",
			"delve",
		},
	})
end

return {
	P,
	{
		"rcarriga/nvim-dap-ui",
		lazy = true,
		dependencies = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			require("dapui").setup()
		end,
	},
}
