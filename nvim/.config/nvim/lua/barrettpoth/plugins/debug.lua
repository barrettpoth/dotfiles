return {
  'mfussenegger/nvim-dap',
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',

    -- Required dependency for nvim-dap-ui
    'nvim-neotest/nvim-nio',

    'theHamsta/nvim-dap-virtual-text',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- debuggers
    'suketa/nvim-dap-ruby',

    'mfussenegger/nvim-dap-python',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'
    local dap_python = require 'dap-python'

    require('dap-ruby').setup()

    require('nvim-dap-virtual-text').setup()

    require('mason-nvim-dap').setup {
      -- Makes a best effort to setup the various debuggers with
      -- reasonable debug configurations
      automatic_installation = true,

      -- You can provide additional configuration to the handlers,
      -- see mason-nvim-dap README for more information
      handlers = {},

      -- You'll need to check that you have the required things installed
      -- online, please don't ask me how to install them :)
      ensure_installed = {
        -- Update this to ensure that you have the debuggers for the langs you want
      },
    }

    -- Basic debugging keymaps, feel free to change to your liking!
    vim.keymap.set('n', '<leader>dr', dap.continue, { desc = 'Debug: Start/Continue' })
    vim.keymap.set('n', '<Leader>d}', dap.step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<Leader>d]', dap.step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<Leader>d{', dap.step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<leader>db', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>dB', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'Debug: Set Breakpoint' })
    vim.keymap.set('n', '<Leader>dc', dap.run_to_cursor, { desc = 'Debug: Run to cursor' })
    vim.keymap.set('n', '<Leader>dl', dap.list_breakpoints, { desc = 'Debug: List breakpoints' })
    vim.keymap.set('n', '<Leader>dD', dap.clear_breakpoints, { desc = 'Debug: clear breakpoints' })
    vim.keymap.set('n', '<Leader>dx', function()
      dap.disconnect()
      dap.close()
    end, { desc = 'Debug: disconnect and close)' })

    -- Dap UI setup
    -- For more information, see |:help nvim-dap-ui|
    dapui.setup {
      -- Set icons to characters that are more likely to work in every terminal.
      --    Feel free to remove or use ones that you like more! :)
      --    Don't feel like these are good choices.
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
      layouts = {
        {
          elements = {
            {
              id = 'breakpoints',
              size = 0.25,
            },
            {
              id = 'scopes',
              size = 0.25,
            },
            {
              id = 'watches',
              size = 0.25,
            },
            {
              id = 'stacks',
              size = 0.25,
            },
          },
          position = 'left',
          size = 80,
        },
        {
          elements = {
            {
              id = 'repl',
              size = 0.5,
            },
            {
              id = 'console',
              size = 0.5,
            },
          },
          position = 'bottom',
          size = 18,
        },
      },
    }

    -- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
    vim.keymap.set('n', '<leader>dl', dapui.toggle, { desc = 'Debug: See last session result.' })

    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close

    -- dap-python
    dap_python.setup '~/.virtualenvs/debugpy/bin/python'
    vim.keymap.set('n', '<Leader>dt', function()
      dap_python.test_method()
    end)
    vim.keymap.set('n', '<Leader>dT', function()
      dap_python.test_class()
    end)
    vim.keymap.set('v', '<Leader>dv', function()
      dap_python.debug_selection()
    end)

    for _, language in ipairs { 'typescript', 'typescriptreact', 'javascript' } do
      dap.configurations[language] = {
        {
          type = 'pwa-node',
          request = 'attach',
          processId = require('dap.utils').pick_process,
          name = 'Attach debugger to existing `node --inspect` process',
          sourceMaps = true,
          resolveSourceMapLocations = {
            '${workspaceFolder}/**',
            '!**/node_modules/**',
          },
          cwd = '${workspaceFolder}/src',
          skipFiles = { '${workspaceFolder}/node_modules/**/*.js' },
        },
        {
          type = 'pwa-chrome',
          name = 'Launch Chrome',
          request = 'launch',
          url = 'http://localhost:3000',
          skipFiles = { '${workspaceFolder}/node_modules/**/*.js' },
        },
        {
          type = 'pwa-chrome',
          name = 'Attach - Remote Debugging',
          request = 'attach',
          program = '${file}',
          cwd = vim.fn.getcwd(),
          sourceMaps = true,
          protocol = 'inspector',
          port = 9222,
          webRoot = '${workspaceFolder}',
          skipFiles = { '${workspaceFolder}/node_modules/**/*.js' },
        },
      }
    end
  end,
}
