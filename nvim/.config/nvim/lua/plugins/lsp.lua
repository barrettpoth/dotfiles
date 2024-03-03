return {
  "neovim/nvim-lspconfig",
  dependencies = {

    -- LSP Support
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",

    -- Autocompletion
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "onsails/lspkind.nvim",

    -- Snippets
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",

    -- Useful status updates for LSP
    { "j-hui/fidget.nvim", tag = "legacy" },

    "b0o/schemastore.nvim",

    -- integrate non-ls things (like prettier, black, etc) into nvim's lsp
    "jose-elias-alvarez/null-ls.nvim",

    -- wrapper around native neovim lsp formatting that does async format on save and a few more things
    "lukas-reineke/lsp-format.nvim",

    -- rust tools, if using this do not set up rust_analyzer in lspconfig
    "simrat39/rust-tools.nvim",
  },

  config = function()
    -- first setup mason
    require "barrettpoth/lsp/mason-lspconfig"

    -- then setup lsp config
    local configs = require("barrettpoth/lsp/configs").configs
    local lspconfig = require "lspconfig"

    local custom_capabilities = vim.lsp.protocol.make_client_capabilities()
    custom_capabilities.textDocument.foldingRange = {
      dynamicRegistration = false,
      lineFoldingOnly = true,
    }

    local custom_attach = function(client, bufnr)
      local nmap = function(keys, func, desc)
        if desc then
          desc = "LSP: " .. desc
        end

        vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
      end

      nmap("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
      nmap("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction")
      nmap("[d", vim.diagnostic.goto_prev, "Go to next [d]iagnostic")
      nmap("]d", vim.diagnostic.goto_next, "Go to previous [d]iagnostic")
      nmap("<C-d>", vim.diagnostic.open_float, "Open diagnostic in floating window")

      nmap("gd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
      nmap("gr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
      nmap("gi", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
      nmap("gt", require("telescope.builtin").lsp_type_definitions, "[G]oto [T]ype definition")

      -- See `:help K` for why this keymap
      nmap("K", vim.lsp.buf.hover, "Hover Documentation")

      -- have to require illuminate plugin here - used for highlighted cursor word
      require("illuminate").on_attach(client)
    end

    local setup_server = function(server, config)
      if not config then
        return
      end

      if type(config) ~= "table" then
        config = {}
      end

      config = vim.tbl_deep_extend("force", {
        on_attach = custom_attach,
        capabilities = custom_capabilities,
      }, config)

      lspconfig[server].setup(config)
    end

    for server, config in pairs(configs) do
      setup_server(server, config)
    end

    -- rust-tools, only configure if rust_analyzer isn't in the configs table
    if not configs.rust_analyzer then
      local rt = require "rust-tools"
      rt.setup {
        tools = {
          runnables = {
            use_telescope = true,
          },
          inlay_hints = {
            auto = true,
            show_parameter_hints = true,
            parameter_hints_prefix = "",
            other_hints_prefix = "",
          },
        },
        server = {
          -- on_attach is a callback called when the language server attachs to the buffer
          on_attach = custom_attach,
          settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
              -- enable clippy on save
              checkOnSave = {
                command = "clippy",
              },
            },
          },
        },
      }
    end

    -- setup null-ls
    require "barrettpoth/lsp/null-ls"

    -- setup lsp diagnostics
    require "barrettpoth/lsp/diagnostics"

    -- setup lsp handlers
    require "barrettpoth/lsp/handlers"

    -- setup completions
    require "barrettpoth/lsp/cmp"

    -- setup little animation in the bottom right corner that shows lsp working
    require("fidget").setup()
  end,
}
