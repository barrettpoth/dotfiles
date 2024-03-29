return {
  "mfussenegger/nvim-dap",
  dependencies = {
    { "theHamsta/nvim-dap-virtual-text", dependencies = { "mfussenegger/nvim-dap" } },
    { "rcarriga/nvim-dap-ui", dependencies = { "mfussenegger/nvim-dap" } },
    { "suketa/nvim-dap-ruby", dependencies = { "mfussenegger/nvim-dap" } },
    { "mfussenegger/nvim-dap-python", dependencies = { "mfussenegger/nvim-dap" } },
  },
  config = function()
    local dap = require "dap"
    local dapui = require "dapui"
    local dap_python = require "dap-python"
    require("dap-ruby").setup()
    require("nvim-dap-virtual-text").setup()

    vim.keymap.set("n", "<Leader>dr", function()
      dap.continue()
    end)
    vim.keymap.set("n", "<Leader>db", function()
      dap.toggle_breakpoint()
    end)
    vim.keymap.set("n", "<Leader>dB", function()
      dap.set_breakpoint(vim.fn.input "Breakpoint condition: ")
    end)
    vim.keymap.set("n", "<Leader>d]", function()
      dap.step_over()
    end)
    vim.keymap.set("n", "<Leader>d}", function()
      dap.step_into()
    end)
    vim.keymap.set("n", "<Leader>d{", function()
      dap.step_out()
    end)
    vim.keymap.set("n", "<Leader>dc", function()
      dap.run_to_cursor()
    end)
    vim.keymap.set("n", "<Leader>dl", function()
      dap.list_breakpoints()
    end)
    vim.keymap.set("n", "<Leader>dD", function()
      dap.clear_breakpoints()
    end)
    vim.keymap.set("n", "<Leader>dx", function()
      dap.disconnect()
      dap.close()
    end)

    -- dap-ui
    dapui.setup {
      layouts = {
        {
          elements = {
            {
              id = "breakpoints",
              size = 0.25,
            },
            {
              id = "scopes",
              size = 0.25,
            },
            {
              id = "watches",
              size = 0.25,
            },
            {
              id = "stacks",
              size = 0.25,
            },
          },
          position = "left",
          size = 80,
        },
        {
          elements = {
            {
              id = "repl",
              size = 0.5,
            },
            {
              id = "console",
              size = 0.5,
            },
          },
          position = "bottom",
          size = 18,
        },
      },
    }
    dap.listeners.after.event_initialized["dapui_config"] = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated["dapui_config"] = function()
      dapui.close()
    end
    dap.listeners.before.event_exited["dapui_config"] = function()
      dapui.close()
    end
    vim.keymap.set("n", "<Leader>do", function()
      dapui.toggle()
    end)

    -- dap-python
    dap_python.setup "~/.virtualenvs/debugpy/bin/python"
    vim.keymap.set("n", "<Leader>dt", function()
      dap_python.test_method()
    end)
    vim.keymap.set("n", "<Leader>dT", function()
      dap_python.test_class()
    end)
    vim.keymap.set("v", "<Leader>dv", function()
      dap_python.debug_selection()
    end)

    for _, language in ipairs { "typescript", "typescriptreact", "javascript" } do
      dap.configurations[language] = {
        {
          type = "pwa-node",
          request = "attach",
          processId = require("dap.utils").pick_process,
          name = "Attach debugger to existing `node --inspect` process",
          sourceMaps = true,
          resolveSourceMapLocations = {
            "${workspaceFolder}/**",
            "!**/node_modules/**",
          },
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
      }
    end
  end,
}
