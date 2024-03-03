return {
  -- Additional lua configuration, makes nvim stuff amazing
  "folke/neodev.nvim",
  opts = {
    library = { plugins = { "neotest", "nvim-dap-ui" }, types = true },
  },
}
