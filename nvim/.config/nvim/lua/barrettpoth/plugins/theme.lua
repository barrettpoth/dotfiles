return {
  'scottmckendry/cyberdream.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('cyberdream').setup {
      transparent = true,
      italic_comments = true,
      hide_fillchars = false,
      borderless_telescope = false,
      terminal_colors = true,
      theme = {
        variant = 'dark',
      },
      extensions = {
        telescope = true,
        notify = false,
        mini = true,
      },
    }

    vim.cmd [[colorscheme cyberdream]]
  end,
}
