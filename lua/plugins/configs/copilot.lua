return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions" },
    keys = {
      { "<leader>]", "<cmd>CodeCompanionActions<CR>", desc = "AI Actions", mode = { "n", "v" } },
      { "<leader><leader>]", "<cmd>CodeCompanionChat<CR>", desc = "AI Chat" },
    },
    opts = {
      strategies = {
        chat   = { adapter = "ollama" },
        inline = { adapter = "ollama" },
      },
      adapters = {
        ollama = function()
          return require("codecompanion.adapters").extend("ollama", {
            schema = {
              model = { default = "qwen2.5-coder:3b" },
            },
          })
        end,
      },
      display = {
        action_palette = { provider = "snacks" },
        chat = { render_headers = false },
      },
    },
  },
  {
    "nickjvandyke/opencode.nvim",
    version = "*",
    config = function()
      ---@diagnostic disable-next-line: undefined-global
      vim.o.autoread = true
    end,
  },
}
