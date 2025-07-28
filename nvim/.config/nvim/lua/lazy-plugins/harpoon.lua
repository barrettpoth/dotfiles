return {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local harpoon = require 'harpoon'
    harpoon:setup {}

    -- basic telescope configuration
    vim.keymap.set('n', '<localleader>e', function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    vim.keymap.set('n', '<localleader>a', function()
      harpoon:list():add()
    end)

    vim.keymap.set('n', '<localleader>1', function()
      harpoon:list():select(1)
    end)

    vim.keymap.set('n', '<localleader>2', function()
      harpoon:list():select(2)
    end)

    vim.keymap.set('n', '<localleader>3', function()
      harpoon:list():select(3)
    end)

    vim.keymap.set('n', '<localleader>4', function()
      harpoon:list():select(4)
    end)

    vim.keymap.set('n', '<localleader>5', function()
      harpoon:list():select(5)
    end)

    vim.keymap.set('n', '<localleader>6', function()
      harpoon:list():select(6)
    end)

    vim.keymap.set('n', '<localleader>7', function()
      harpoon:list():select(7)
    end)

    vim.keymap.set('n', '<localleader>8', function()
      harpoon:list():select(8)
    end)

    vim.keymap.set('n', '<localleader>9', function()
      harpoon:list():select(9)
    end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set('n', '[e', function()
      harpoon:list():prev()
    end)

    vim.keymap.set('n', 'e]', function()
      harpoon:list():next()
    end)
  end,
}
