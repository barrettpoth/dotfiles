local null_ls = require "null-ls"
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup {
  debug = false,
  sources = {
    formatting.stylua,
    formatting.prettierd.with {
      extra_filetypes = { "toml" },
      extra_args = {},
    },
    formatting.black,
    formatting.beautysh,
    formatting.rubocop,
    formatting.sql_formatter,
    formatting.rustfmt,
    diagnostics.rubocop.with {
      command = "bundle",
      args = { "exec", "rubocop", "--format", "json", "--force-exclusion", "--stdin", "$FILENAME" },
      source_name = "rubocop",
      debounce = 100,
      parse = {
        errors = {
          "location",
          "message",
          "severity",
          "cop_name",
        },
        line = "location.start_line",
        column = "location.start_column",
        end_line = "location.last_line",
        end_column = "location.last_column",
        message = "${severity} [${cop_name}] ${message}",
        security = "severity",
      },
      securities = {
        fatal = "error",
        error = "error",
        warning = "warning",
        convention = "info",
        refactor = "info",
        info = "info",
      },
    },
  },
  on_attach = require("lsp-format").on_attach,
}
