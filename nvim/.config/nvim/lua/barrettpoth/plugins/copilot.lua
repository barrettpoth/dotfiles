return {
  'github/copilot.vim',
  config = function()
    vim.keymap.set('i', '<A-]>', '<Plug>(copilot-next)')
    vim.keymap.set('i', '<A-[>', '<Plug>(copilot-previous)')
    vim.keymap.set('i', '<A-p>', '<Plug>(copilot-suggest)')
    vim.keymap.set('i', '<C-]>', '<Plug>(copilot-dismiss)')

    vim.g.copilot_filetypes = {
      ['*'] = false,
      ['python'] = true,
      ['lua'] = true,
      ['rust'] = true,
      ['clojure'] = true,
      ['R'] = true,
      ['nu'] = true,
      ['javascript'] = true,
      ['typescript'] = true,
      ['go'] = true,
      ['ruby'] = true,
      ['markdown'] = false,
    }
  end,
}
