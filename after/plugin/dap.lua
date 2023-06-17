local dap = require("dap")
local dapui = require("dapui")
local dap_python = require("dap-python")
require('dap-ruby').setup()
require('dap-ruby').setup()
require("nvim-dap-virtual-text").setup()

vim.keymap.set('n', '<Leader>dr', function() dap.continue() end)
vim.keymap.set('n', '<Leader>db', function() dap.toggle_breakpoint() end)
vim.keymap.set('n', '<Leader>dB', function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end)
vim.keymap.set('n', '<Leader>d]', function() dap.step_over() end)
vim.keymap.set('n', '<Leader>d}', function() dap.step_into() end)
vim.keymap.set('n', '<Leader>d{', function() dap.step_out() end)
vim.keymap.set('n', '<Leader>dc', function() dap.run_to_cursor() end)
vim.keymap.set('n', '<Leader>dl', function() dap.list_breakpoints() end)
vim.keymap.set('n', '<Leader>dD', function() dap.clear_breakpoints() end)
vim.keymap.set('n', '<Leader>dx', function()
    dap.disconnect()
    dap.close()
end)

-- dap-ui
dapui.setup()
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end
vim.keymap.set('n', '<Leader>do', function() dapui.toggle() end)

-- dap-python
dap_python.setup('~/.virtualenvs/debugpy/bin/python')
vim.keymap.set('n', '<Leader>dt', function() dap_python.test_method() end)
vim.keymap.set('n', '<Leader>dT', function() dap_python.test_class() end)
vim.keymap.set('v', '<Leader>dv', function() dap_python.debug_selection() end)
