return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      local statusline = require 'mini.statusline'

      statusline.setup { use_icons = vim.g.have_nerd_font }

      statusline.section_location = function()
        local current_line = vim.api.nvim_win_get_cursor(0)[1]
        local total_lines = vim.api.nvim_buf_line_count(0)
        local percentage = math.floor((current_line / total_lines) * 100)

        formmatted_location = '%l:%v'
        formmatted_percent = string.format('%d', percentage) .. '%%'
        return formmatted_location .. " | " .. formmatted_percent
      end

      statusline.section_searchcount = function() end

      vim.api.nvim_set_hl(0, 'MiniStatuslineDevinfo', { fg = '#ff6e5e', bg = '#3c4048' })
      vim.api.nvim_set_hl(0, 'MiniStatuslineFilename', { fg = '#ffffff', bg = '#3c4048' })
      vim.api.nvim_set_hl(0, 'MiniStatuslineFileinfo', { fg = '#16181a', bg = '#bd5eff' })

      -- set non-active statusline to a different color
      vim.api.nvim_set_hl(0, 'MiniStatuslineInactive', { fg = '#ffffff', bg = '#1e2124' })
    end,
  },
}
