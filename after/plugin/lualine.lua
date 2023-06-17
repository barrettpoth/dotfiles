require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = {
            'branch',
            'diff',
            {
                'diagnostics',
                sources = { 'nvim_lsp' },
                sections = { 'error', 'warn', 'info', 'hint' },
                symbols = {
                    hint = "",
                    info = "",
                    warn = "",
                    error = "",
                },
                colored = true,
                update_in_insert = false,
                always_visible = false,
            },
        },
        lualine_c = {
            {
                'filename',
                newfile_status = false, -- Display new file status (new file means no write after created)
                -- 0: Just the filename
                -- 1: Relative path
                -- 2: Absolute path
                -- 3: Absolute path, with tilde as the home directory
                path = 1,
                shorting_target = 40, -- Shortens path to leave 40 spaces in the window for other components. (terrible name, any suggestions?)
            }
        },
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {}
}
