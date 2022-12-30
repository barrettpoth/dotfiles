-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim', "nvim-telescope/telescope-live-grep-args.nvim" } },
        config = function()
            require("telescope").load_extension("live_grep_args")
        end
    }

    use({ 'rose-pine/neovim', as = 'rose-pine', })


    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use { -- Additional text objects via treesitter
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
    }
    use('mbbill/undotree')
    use {
        'dinhhuy258/git.nvim'
    }
    use 'lewis6991/gitsigns.nvim'
    use "terrortylor/nvim-comment"
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons', opt = true }
    }

    use {
        'nvim-tree/nvim-tree.lua',
        tag = 'nightly' -- optional, updated every week. (see issue #1193)
    }

    use { 'kyazdani42/nvim-web-devicons' }
    use { 'akinsho/bufferline.nvim' }
    use { 'farmergreg/vim-lastplace' }
    use { 'RRethy/vim-illuminate' }
    use {
        'windwp/nvim-autopairs',
        config = function() require('nvim-autopairs').setup {} end
    }
    use { 'tpope/vim-dadbod' }
    use { 'kristijanhusak/vim-dadbod-ui' }
    use { 'kristijanhusak/vim-dadbod-completion' }
    use { "akinsho/toggleterm.nvim", tag = '*' }

    use {
        'VonHeikemen/lsp-zero.nvim',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' },
            { 'williamboman/mason.nvim' },
            { 'williamboman/mason-lspconfig.nvim' },

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },
            { 'hrsh7th/cmp-buffer' },
            { 'hrsh7th/cmp-path' },
            { 'saadparwaiz1/cmp_luasnip' },
            { 'hrsh7th/cmp-nvim-lsp' },
            { 'hrsh7th/cmp-nvim-lua' },

            -- Snippets
            { 'L3MON4D3/LuaSnip' },
            { 'rafamadriz/friendly-snippets' },

            -- Useful status updates for LSP
            'j-hui/fidget.nvim',

            -- Additional lua configuration, makes nvim stuff amazing
            'folke/neodev.nvim',
        }
    }

    -- integrate non-ls things (like prettier, black, etc) into nvim's lsp
    use {
        "jose-elias-alvarez/null-ls.nvim",
    }
    -- wrapper around native neovim lsp formatting that does async format on save and a few more things
    use { "lukas-reineke/lsp-format.nvim" }

    use { "anuvyklack/help-vsplit.nvim" }

    use { 'tpope/vim-unimpaired' }

    use { 'romainl/vim-qf' }

    use { 'lukas-reineke/indent-blankline.nvim' }

    use { 'christoomey/vim-tmux-navigator' }
    use { 'marklcrns/vim-smartq' }

    use { 'camgraff/telescope-tmux.nvim' }

    use("github/copilot.vim")
end)
