return {
  { 'nvim-neotest/neotest-plenary' },
  {
    'nvim-neotest/neotest',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-treesitter/nvim-treesitter',
      'antoinemadec/FixCursorHold.nvim',
      'zidhuss/neotest-minitest',
      'olimorris/neotest-rspec',
      'nvim-neotest/nvim-nio',
    },
    opts = {
      status = {
        virtual_text = true,
        signs = true,
        update_in_insert = false,
        underline = true,
      },
    },
    config = function()
      local neotest = require 'neotest'

      neotest.setup {
        adapters = {
          require 'neotest-minitest',
          require 'neotest-rspec',
        },
      }

      local nmap = function(keys, func, desc)
        if desc then
          desc = 'Neotest: ' .. desc
        end

        vim.keymap.set('n', keys, func, { desc = desc })
      end

      nmap('<C-t><C-t>', neotest.run.run, 'Run the nearest test')
      nmap('<C-t><C-l>', neotest.run.run_last, 'Run the last test')
      nmap('<C-t><C-s>', neotest.summary.toggle, 'Toggle the summary window')
      nmap('<C-t><C-o>', neotest.output.open, 'Open the output window')
      nmap('[t', function()
        neotest.jump.prev { status = 'failed' }
      end, 'Jump to the next failed test')
      nmap(']t', function()
        neotest.jump.next { status = 'failed' }
      end, 'Jump to the previous failed test')
    end,
  },
}
