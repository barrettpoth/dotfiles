local diagnostic_icons = require("barrettpoth/utils").diagnostic_icons

vim.diagnostic.config {
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
    source = "always",
  },
}

vim.fn.sign_define("DiagnosticSignError", { text = diagnostic_icons.error, texthl = "DiagnosticSignError" })
vim.fn.sign_define("DiagnosticSignWarn", { text = diagnostic_icons.warn, texthl = "DiagnosticSignWarn" })
vim.fn.sign_define("DiagnosticSignInfo", { text = diagnostic_icons.info, texthl = "DiagnosticSignInfo" })
vim.fn.sign_define("DiagnosticSignHint", { text = diagnostic_icons.hint, texthl = "DiagnosticSignHint" })
