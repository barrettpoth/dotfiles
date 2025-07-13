-- [[ Configure and install plugins ]]

require('lazy').setup({
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  { 'numToStr/Comment.nvim', opts = {} },

  require 'lazy-plugins/gitsigns',

  require 'lazy-plugins/telescope',

  require 'lazy-plugins/theme',

  require 'lazy-plugins/mini',

  require 'lazy-plugins/treesitter',

  require 'lazy-plugins/indent_line',

  require 'lazy-plugins/lint',

  require 'lazy-plugins/autopairs',

  require 'lazy-plugins/harpoon',

  require 'lazy-plugins/git',

  require 'lazy-plugins/surround',

  'farmergreg/vim-lastplace',

  'camgraff/telescope-tmux.nvim',

  require 'lazy-plugins/markdown-preview',

  'tpope/vim-rails',

  require 'lazy-plugins/autotag',

  'RRethy/nvim-treesitter-endwise',

  require 'lazy-plugins/test',

  require 'lazy-plugins/tmux-nav',

  require 'lazy-plugins/oil',

  require 'lazy-plugins/fold',
})
