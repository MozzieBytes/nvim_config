return {
	"neovim/nvim-lspconfig",
	cmd = "LspInfo",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
	},
  config = function()
    vim.api.nvim_create_user_command("LspHelp", function()
      vim.cmd("help lspconfig-all")
    end, {})
  end,
}
