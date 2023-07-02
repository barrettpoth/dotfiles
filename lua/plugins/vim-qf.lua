return {
  "romainl/vim-qf",
  config = function()
    vim.keymap.set("n", "<leader>qq", "<Plug>(qf_qf_toggle)")
    vim.keymap.set("n", "<leader>ll", "<Plug>(qf_loc_toggle)")
  end,
}
