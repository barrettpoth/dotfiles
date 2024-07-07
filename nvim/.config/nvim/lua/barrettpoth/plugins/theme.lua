-- return {
--   'projekt0n/github-nvim-theme',
--   priority = 1000,
--   config = function()
--     require('github-theme').setup {
--       options = {
--         styles = {
--           comments = 'italic',
--         },
--       },
--     }
--     vim.cmd [[colorscheme github_dark]]
--   end,
-- }

return {
  'folke/tokyonight.nvim',
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    vim.g.tokyonight_style = 'night'
    vim.g.tokyonight_italic_functions = true
    vim.g.tokyonight_italic_variables = true
    vim.g.tokyonight_italic_keywords = true
    vim.g.tokyonight_italic_comments = true
    vim.cmd [[colorscheme tokyonight]]
  end,
}
