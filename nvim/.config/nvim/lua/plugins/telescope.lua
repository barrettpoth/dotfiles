return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.4",
  dependencies = {
    {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
      "nvim-telescope/telescope-dap.nvim",
    },
  },

  config = function()
    local ts = require "telescope"
    ts.setup {
      pickers = {
        lsp_references = {
          include_declaration = false,
          show_line = false,
        },
        lsp_definitions = {
          include_declaration = false,
          show_line = false,
        },
      },
    }

    local builtin = require "telescope.builtin"

    local nmap = function(keys, func, desc)
      if desc then
        desc = "Telescope: " .. desc
      end

      vim.keymap.set("n", keys, func, { desc = desc })
    end

    nmap("<leader>f", builtin.find_files, "[F]ind files")
    nmap("<leader>tg", builtin.live_grep, "[T]elescope by live [g]rep")

    nmap("<leader>ts", builtin.git_status, "[T]elescope git [s]tatus")
    nmap("<leader>tl", builtin.git_commits, "[T]elescope git commit [l]og")
    nmap("<leader>tbl", builtin.git_bcommits, "[T]elescope [b]uffer commit [l]og")
    nmap("<leader>tb", builtin.git_branches, "[T]elescope git [b]ranch")

    nmap("<leader>td", "<cmd>Telescope diagnostics<CR>", "[T]elescope diagnostics in telescope")

    nmap("<leader>th", "<cmd>Telescope help_tags<cr>", "[T]elescope [h]elp tags")
    nmap("<leader>tk", "<cmd>Telescope keymaps<cr>", "[T]elescope [k]eymaps")

    nmap("<leader>tt", ":Telescope tmux sessions<CR>", "[T]elescope [t]mux sessions")

    nmap("<leader>tdb", function()
      ts.extensions.dap.list_breakpoints {}
    end, "[T]elescope [d]ap [b]reakpoints")
    nmap("<leader>tdc", function()
      ts.extensions.dap.commands {}
    end, "[T]elescope [d]ap [c]ommands")
    nmap("<leader>tdv", function()
      ts.extensions.dap.variables {}
    end, "[T]elescope [d]ap [v]ariables")
    nmap("<leader>tdf", function()
      ts.extensions.dap.frames {}
    end, "[T]elescope [d]ap [f]rames")
    nmap("<leader>tds", function()
      ts.extensions.dap.configurations {}
    end, "[T]elescope [d]ap [s]essions")
  end,
}
