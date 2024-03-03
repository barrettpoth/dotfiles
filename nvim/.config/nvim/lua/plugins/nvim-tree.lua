return {
  "nvim-tree/nvim-tree.lua",
  tag = "v1",
  config = function()
    local diagnostic_icons = require("barrettpoth/utils").diagnostic_icons

    -- open nvim-tree when opening a directory
    local function open_nvim_tree(data)
      -- buffer is a directory
      local directory = vim.fn.isdirectory(data.file) == 1

      if not directory then
        return
      end

      -- change to the directory
      vim.cmd.cd(data.file)
    end

    local nvim_tree = require "nvim-tree"

    nvim_tree.setup {
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
      actions = {
        open_file = {
          quit_on_open = true,
        },
      },
      renderer = {
        root_folder_modifier = ":t",
        icons = {
          glyphs = {
            default = "",
            symlink = "",
            folder = {
              arrow_open = "",
              arrow_closed = "",
              default = "",
              open = "",
              empty = "",
              empty_open = "",
              symlink = "",
              symlink_open = "",
            },
            git = {
              unstaged = "",
              staged = "S",
              unmerged = "",
              renamed = "➜",
              untracked = "U",
              deleted = "",
              ignored = "◌",
            },
          },
        },
        add_trailing = true,
        highlight_git = true,
        highlight_opened_files = "all",
      },
      diagnostics = {
        enable = true,
        show_on_dirs = true,
        icons = {
          hint = diagnostic_icons.hint,
          info = diagnostic_icons.info,
          warning = diagnostic_icons.warn,
          error = diagnostic_icons.error,
        },
      },
      view = {
        width = 50,
        side = "left",
      },
    }

    vim.keymap.set("n", "<leader>e", vim.cmd.NvimTreeToggle, {})
  end,
}
