-- The status line at the bottom of the screen
return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        disabled_filetypes = {
            statusline = {'neo-tree'},
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = {'filename', 'nvim_treesitter#statusline'},
            lualine_x = {'encoding', 'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'searchcount', 'location'},
        },
    },
    config = true,
}
