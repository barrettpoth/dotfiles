return {
  "folke/zen-mode.nvim",
  config = function()
    require("zen-mode").setup {
      window = {
        width = 130, -- width of the Zen window
        height = 1, -- height of the Zen window
      },
      plugins = {
        options = {
          enabled = true,
          ruler = false, -- disables the ruler text in the cmd line area
          showcmd = false, -- disables the command in the last line of the screen
        },
      },
    }

    -- add key map to toggle zen mode
    vim.api.nvim_set_keymap("n", "<leader>z", ":ZenMode<CR>", { noremap = true, silent = true })
  end,
}
