local language_servers = {
  "lua_ls",
  "nil_ls",
  "tofu_ls",
  "terraform_ls",
  "powershell_es",
}

for _, lsp in ipairs(language_servers) do
  vim.lsp.enable(lsp)
end
