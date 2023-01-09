-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
    -- Packer can manage itself
    use { 'wbthomason/packer.nvim' }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = { { 'nvim-lua/plenary.nvim', "nvim-telescope/telescope-live-grep-args.nvim" } },
        config = function()
            require("telescope").load_extension("live_grep_args")
        end
    }

    use { "olimorris/onedarkpro.nvim" }

    use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
    use { -- Additional text objects via treesitter
        'nvim-treesitter/nvim-treesitter-textobjects',
        after = 'nvim-treesitter',
    }

    use('mbbill/undotree')

    use { 'dinhhuy258/git.nvim' }

    use { 'lewis6991/gitsigns.nvim' }

    use { "terrortylor/nvim-comment" }

    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function() require("nvim-surround").setup({}) end
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
    use { "jose-elias-alvarez/null-ls.nvim", }

    -- wrapper around native neovim lsp formatting that does async format on save and a few more things
    use { "lukas-reineke/lsp-format.nvim" }

    use { "anuvyklack/help-vsplit.nvim" }

    use { 'tpope/vim-unimpaired' }

    use { 'romainl/vim-qf' }

    use { 'lukas-reineke/indent-blankline.nvim' }

    use { "alexghergh/nvim-tmux-navigation" }

    use { 'marklcrns/vim-smartq' }

    use { 'camgraff/telescope-tmux.nvim' }

    use { "github/copilot.vim" }

    use { "folke/zen-mode.nvim", }

    use { 'preservim/vim-markdown' }

    use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install",
        setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })

    use { 'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async' }

    use { 'tpope/vim-sleuth' }

    use { 'lewis6991/impatient.nvim' }
end)
