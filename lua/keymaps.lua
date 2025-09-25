-- Define common options
local opts = { noremap = true, silent = true }

-- Helper for global mappings
local set_global_map = function(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, opts)
end

-----------------
-- Normal mode --
-----------------

-- Better window navigation
set_global_map("n", "<C-h>", "<C-w>h")
set_global_map("n", "<C-j>", "<C-w>j")
set_global_map("n", "<C-k>", "<C-w>k")
set_global_map("n", "<C-l>", "<C-w>l")

-- Resize with arrows (delta: 2 lines)
set_global_map("n", "<C-Up>", ":resize -2<CR>")
set_global_map("n", "<C-Down>", ":resize +2<CR>")
set_global_map("n", "<C-Left>", ":vertical resize -2<CR>")
set_global_map("n", "<C-Right>", ":vertical resize +2<CR>")

-- Window Management
set_global_map("n", "<leader>vs", ":vs<CR>")
set_global_map("n", "<leader>hs", ":split<CR>")
set_global_map("n", "<leader>q", ":bd<CR>")

-----------------
-- Visual mode --
-----------------

-- Reselect visual area after shifting
set_global_map("v", "<", "<gv")
set_global_map("v", ">", ">gv")

-----------------
----- LSP ------
----------------
vim.lsp.config("*", {
	on_attach = function(_, bufnr)
		local function set_lsp_map(mode, lhs, rhs)
			opts = { buffer = bufnr }
			vim.keymap.set(mode, lhs, rhs, opts)
		end

		set_lsp_map("n", "<leader>gh", vim.lsp.buf.hover)
		set_lsp_map("n", "<leader>gd", "<cmd>Telescope lsp_definitions<cr>")
		set_lsp_map("n", "<leader>gD", vim.lsp.buf.declaration)
		set_lsp_map("n", "<leader>gi", "<cmd>Telescope lsp_implementations<cr>")
		set_lsp_map("n", "<leader>go", "<cmd>Telescope lsp_type_definitions<cr>")
		set_lsp_map("n", "<leader>gr", "<cmd>Telescope lsp_references<cr>")
		set_lsp_map("n", "<leader>gs", vim.lsp.buf.signature_help)
		set_lsp_map({ "n", "v" }, "<leader>rr", vim.lsp.buf.rename)
		set_lsp_map({ "n", "x" }, "<leader>;", function()
			vim.lsp.buf.format({ async = true })
		end)
		set_lsp_map("n", "<leader>[", function()
			require("tiny-code-action").code_action()
		end)
	end,
})
