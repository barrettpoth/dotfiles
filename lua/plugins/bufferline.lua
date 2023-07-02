return {
  "akinsho/bufferline.nvim",
  config = function()
    local diagnostic_icons = require("barrettpoth/utils").diagnostic_icons

    require("bufferline").setup {
      options = {
        numbers = "none", -- | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
        indicator = { style = "icon", icon = "▎" },
        modified_icon = "●",
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 30,
        max_prefix_length = 30, -- prefix used when a buffer is de-duplicated
        tab_size = 21,
        diagnostics = "nvim_lsp",
        diagnostics_update_in_insert = false,
        diagnostics_indicator = function(count, level)
          local icons = {
            hint = diagnostic_icons.hint,
            info = diagnostic_icons.info,
            warning = diagnostic_icons.warn,
            error = diagnostic_icons.error,
          }
          return icons[level] .. " " .. count
        end,
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        show_buffer_icons = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
        show_tab_indicators = false,
        persist_buffer_sort = true,
        separator_style = "thin",
        enforce_regular_tabs = true,
        always_show_bufferline = true,
      },
    }

    -- Navigate buffers
    vim.keymap.set("n", "<S-l>", ":bnext<CR>")
    vim.keymap.set("n", "<S-h>", ":bprevious<CR>")
    vim.keymap.set("n", "gb", ":BufferLinePick<CR>")
    vim.keymap.set("n", "gB", ":BufferLinePickClose<CR>")
    vim.keymap.set("n", "<leader>1", ":BufferLineGoToBuffer 1<CR>")
    vim.keymap.set("n", "<leader>2", ":BufferLineGoToBuffer 2<CR>")
    vim.keymap.set("n", "<leader>3", ":BufferLineGoToBuffer 3<CR>")
    vim.keymap.set("n", "<leader>4", ":BufferLineGoToBuffer 4<CR>")
    vim.keymap.set("n", "<leader>5", ":BufferLineGoToBuffer 5<CR>")
    vim.keymap.set("n", "<leader>6", ":BufferLineGoToBuffer 6<CR>")
    vim.keymap.set("n", "<leader>7", ":BufferLineGoToBuffer 7<CR>")
    vim.keymap.set("n", "<leader>8", ":BufferLineGoToBuffer 8<CR>")
    vim.keymap.set("n", "<leader>9", ":BufferLineGoToBuffer 9<CR>")
  end,
}
