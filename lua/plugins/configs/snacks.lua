return {
  "folke/snacks.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    bigfile = { enabled = true },
    dashboard = { enabled = true },
    ---@class snacks.explorer.Config
    explorer = {
      enabled = true,
      replace_netrw = true,
      trash = true,
    },
    indent = { enabled = true },
    input = { enabled = true },
    picker = {
      enabled = true,
      focus = "list",
      sources = {
        explorer = {
          layout = {
            preset = "sidebar",
            layout = { position = "right" },
            auto_hide = { "input" },
          },
        },
      },
    },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    words = { enabled = true },
    terminal = {
      enabled = true,
      win = {
        style = "float",
        width = 0.8,
        height = 0.8,
        border = "rounded",
      },
    },
  },
  keys = {
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find files" },
    { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Find buffer" },
    { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Git: Find tracked file" },
    { "<leader>fh", function() Snacks.picker.help_tags() end, desc = "Help Tags" },
    { "<leader>fe", function() Snacks.explorer() end, desc = "File Explorer", mode = { "n", "v" } },
    { "<leader>qq", function() Snacks.bufdelete() end, desc = "Close Buffer" },
    { "<leader>/", function() Snacks.picker.grep() end, desc = "File Grep" },
    -- LSP
    { "<leader>ldf", function() Snacks.picker.lsp_references() end, desc = "LSP: List definitions"},
    { "<leader>lr", function() Snacks.picker.lsp_references() end, desc = "LSP: List references" },
    { "<leader>li", function() Snacks.picker.lsp_implementations() end, desc = "LSP: List implementations" },
    { "<leader>ltd", function() Snacks.picker.lsp_type_definitions() end, desc = "LSP: List type definitions" },
    -- Git
    { "<leader>st", function() Snacks.picker.git_status() end, desc = "Git: Status" },
    { "<leader>co", function() Snacks.picker.git_branches() end, desc = "Git: Checkout" },
    -- Neovim
    { "<leader>vk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    { "<leader>vm", function() Snacks.picker.marks() end, desc = "Marks" },
    { "<leader>vr", function() Snacks.picker.registers() end, desc = "Marks" },
    -- Terminal
    { "<leader>tt", function() Snacks.terminal.toggle(vim.o.shell) end, desc = "Toggle Terminal", mode = "n" },
    { "<c-q>", "<cmd>close<CR>", desc = "Close Terminal", mode = "t" },
  },
}
