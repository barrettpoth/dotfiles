require("mason").setup()
require("mason-lspconfig").setup {
  ensure_installed = {
    "pyright",
    "tsserver",
    "eslint",
    "lua_ls",
    "rust_analyzer",
    "ruby_ls",
    "marksman",
  },
}
