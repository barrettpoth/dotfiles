-- [[ Configure and install plugins ]]

require('lazy').setup({
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  { 'numToStr/Comment.nvim', opts = {} },

  require 'barrettpoth/plugins/gitsigns',

  require 'barrettpoth/plugins/telescope',

  require 'barrettpoth/plugins/lspconfig',

  require 'barrettpoth/plugins/conform',

  require 'barrettpoth/plugins/cmp',

  require 'barrettpoth/plugins/theme',

  require 'barrettpoth/plugins/mini',

  require 'barrettpoth/plugins/treesitter',

  require 'barrettpoth/plugins/debug',

  require 'barrettpoth/plugins/indent_line',

  require 'barrettpoth/plugins/lint',

  require 'barrettpoth/plugins/autopairs',

  -- NOTE: everything above came recommended by kickstart-nvim, below are my additions

  require 'barrettpoth/plugins/harpoon',

  require 'barrettpoth/plugins/copilot',

  require 'barrettpoth/plugins/git',

  require 'barrettpoth/plugins/surround',

  'farmergreg/vim-lastplace',

  'camgraff/telescope-tmux.nvim',

  require 'barrettpoth/plugins/markdown-preview',

  'tpope/vim-rails',

  require 'barrettpoth/plugins/autotag',

  'RRethy/nvim-treesitter-endwise',

  require 'barrettpoth/plugins/test',

  require 'barrettpoth/plugins/tmux-nav',

  require 'barrettpoth/plugins/oil',

  require 'barrettpoth/plugins/fold',

  require 'barrettpoth/plugins/colorizer',
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})
