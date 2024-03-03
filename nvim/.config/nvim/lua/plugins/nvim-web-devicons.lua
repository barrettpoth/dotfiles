return {
  "nvim-tree/nvim-web-devicons",
  config = function()
    require("nvim-web-devicons").set_icon {
      gql = {
        icon = "",
        color = "#e535ab",
        cterm_color = "199",
        name = "GraphQL",
      },
      toml = {
        icon = "",
        color = "#8cc4f3",
        cterm_color = "117",
        name = "TOML",
      },
    }
  end,
}
