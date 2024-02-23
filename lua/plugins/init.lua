return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.0",
    dependencies = {
      {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-live-grep-args.nvim",
        "nvim-telescope/telescope-dap.nvim",
      },
    },
    config = function()
      require("telescope").load_extension "live_grep_args"
      require("telescope").load_extension "dap"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
  },

  "dinhhuy258/git.nvim",

  "lewis6991/gitsigns.nvim",

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup {
        -- Configuration here, or leave empty to use defaults
      }
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons", lazy = true },
  },

  {
    "nvim-tree/nvim-tree.lua",
    tag = "nightly", -- optional, updated every week. (see issue #1193)
  },

  "kyazdani42/nvim-web-devicons",

  "farmergreg/vim-lastplace",

  "RRethy/vim-illuminate",

  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup {}
    end,
  },

  "anuvyklack/help-vsplit.nvim",

  "tpope/vim-unimpaired",

  "marklcrns/vim-smartq",

  "camgraff/telescope-tmux.nvim",

  "preservim/vim-markdown",

  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },

  "tpope/vim-sleuth",

  "lewis6991/impatient.nvim",

  "tpope/vim-rails",

  {
    "laytan/tailwind-sorter.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-lua/plenary.nvim" },
    build = "cd formatter && npm i && npm run build",
    config = function()
      require("tailwind-sorter").setup {
        on_save_enabled = true, -- If `true`, automatically enables on save sorting.
        on_save_patterns = { "*.html", "*.erb" },
      }
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    dependencies = "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-ts-autotag").setup {
        -- your config
      }
    end,
    lazy = true,
    event = "VeryLazy",
  },
}
