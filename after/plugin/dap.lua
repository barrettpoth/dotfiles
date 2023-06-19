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

-- dap js
require("dap-vscode-js").setup({
    adapters = { 'pwa-node', 'pwa-chrome', 'pwa-msedge', 'node-terminal', 'pwa-extensionHost' }, -- which adapters to register in nvim-dap
})

for _, language in ipairs({ "typescript", "typescriptreact", "javascript" }) do
    dap.configurations[language] = {
        {
            type = "pwa-node",
            request = "attach",
            processId = require 'dap.utils'.pick_process,
            name = "Attach debugger to existing `node --inspect` process",
            sourceMaps = true,
            resolveSourceMapLocations = {
                "${workspaceFolder}/**",
                "!**/node_modules/**" },
            cwd = "${workspaceFolder}/src",
            skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
        },
        {
            type = "pwa-chrome",
            name = "Launch Chrome",
            request = "launch",
            url = "http://localhost:3000",
            skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
        },
        {
            type = "pwa-chrome",
            name = "Attach - Remote Debugging",
            request = "attach",
            program = "${file}",
            cwd = vim.fn.getcwd(),
            sourceMaps = true,
            protocol = "inspector",
            port = 9222,
            webRoot = "${workspaceFolder}",
            skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
        },
        -- only if language is javascript, offer this debug action
        language == "javascript" and {
            -- use nvim-dap-vscode-js's pwa-node debug adapter
            type = "pwa-node",
            -- launch a new process to attach the debugger to
            request = "launch",
            -- name of the debug action you have to select for this config
            name = "Launch file in new node process",
            -- launch current file
            program = "${file}",
            cwd = "${workspaceFolder}",
        } or nil,
    }
end
