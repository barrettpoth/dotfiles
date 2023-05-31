require("neodev").setup({
    library = { plugins = { "neotest" }, types = true },
})

local lsp = require("lsp-zero")
local cmp = require("cmp")
require("lsp-format").setup {}
require("luasnip/loaders/from_vscode").lazy_load()

lsp.set_preferences({
    suggest_lsp_servers = true,
    setup_servers_on_start = true,
    set_lsp_keymaps = true,
    configure_diagnostics = true,
    cmp_capabilities = true,
    manage_nvim_cmp = {
        set_basic_mappings = false,
        set_extra_mappings = false,
        set_sources = 'recommended',
        use_luasnip = true,
        set_format = true,
        documentation_window = true
    },
    call_servers = 'local',
})

-- cmp setup
cmp.setup({
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        -- disable tabs in cmp so that gh copilot works
        ['<Tab>'] = cmp.config.disable,
        ['<S-Tab>'] = cmp.config.disable
    }),
})


lsp.set_sign_icons({
    error = "",
    warn = "",
    hint = "",
    info = "",
})

lsp.ensure_installed({
    'pyright',
    'tsserver',
    'eslint',
    'lua_ls',
    'rust_analyzer',
    'ruby_ls'
})

lsp.nvim_workspace()

-- Fix Undefined global 'vim'
lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            },
        }
    },
    on_attach = require("lsp-format").on_attach
})

lsp.configure('ruby_ls', {
    default_config = {
        cmd = { "bundle", "exec", "ruby-lsp" },
    }
})

-- see inlay hints with lsp-inlayhints and this configuration
lsp.configure('tsserver', {
    settings = {
        typescript = {
            inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            }
        },
        javascript = {
            inlayHints = {
                includeInlayParameterNameHints = 'all',
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = false,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
            }
        }
    }
})

lsp.on_attach(function(client, bufnr)
    -- Disable LSP server formatting, let null-ls sources format
    if client.name == "tsserver" then
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentFormattingRangeProvider = false
    end

    -- In this case, we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.
    local nmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')
    nmap('[d', vim.diagnostic.goto_prev, 'Go to next [d]iagnostic')
    nmap(']d', vim.diagnostic.goto_next, 'Go to previous [d]iagnostic')
    nmap("<C-d>", vim.diagnostic.open_float, 'Open diagnostic in floating window')

    nmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')

    -- See `:help K` for why this keymap
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')

    -- have to require illuminate plugin here - used for highlighted cursor word
    require 'illuminate'.on_attach(client)
end)

lsp.setup()

local function diagnostic_config()
    return {
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
end

vim.diagnostic.config(diagnostic_config())

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
})

require('fidget').setup()
