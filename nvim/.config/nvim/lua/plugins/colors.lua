return {
  "projekt0n/github-nvim-theme",
  priority = 1000,
  config = function()
    require("github-theme").setup {
      options = {
        styles = {
          comments = "italic",
        },
      },
    }
    vim.cmd [[colorscheme github_dark]]
  end,
}
