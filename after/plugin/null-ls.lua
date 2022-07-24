local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting

null_ls.setup({
    debug = false,
    sources = {
        formatting.prettierd.with({
            extra_filetypes = { "toml" },
            extra_args = {},
        }),
        formatting.black,
    },
    on_attach = require("lsp-format").on_attach
})
