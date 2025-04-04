return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    config = function()
      local statusline = require 'mini.statusline'
      -- set use_icons to true if you have a Nerd Font
      statusline.setup { use_icons = vim.g.have_nerd_font }

      statusline.section_location = function()
        return '%2l:%-2v'
      end

      vim.api.nvim_set_hl(0, 'MiniStatuslineDevinfo', { fg = '#ff6e5e', bg = '#3c4048' })
      vim.api.nvim_set_hl(0, 'MiniStatuslineFilename', { fg = '#ffffff', bg = '#3c4048' })
      vim.api.nvim_set_hl(0, 'MiniStatuslineFileinfo', { fg = '#16181a', bg = '#bd5eff' })

      -- set non-active statusline to a different color
      vim.api.nvim_set_hl(0, 'MiniStatuslineInactive', { fg = '#ffffff', bg = '#1e2124' })
    end,
  },
}
