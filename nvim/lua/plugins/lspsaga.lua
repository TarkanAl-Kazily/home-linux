return {
    'nvimdev/lspsaga.nvim',
    opts = {
        ft = {'c', 'cpp'},
        -- https://nvimdev.github.io/lspsaga/finder/
        finder = {
            default = 'def+ref+imp+tyd',
            layout = 'normal',
        }
    },
    config = function(LazyPlugin, opts)
        require('lspsaga').setup(opts)

        vim.keymap.set('n', '<C-j>', '<cmd>Lspsaga hover_doc<CR>')
        vim.keymap.set('n', '<leader>j', '<cmd>Lspsaga finder<CR>')
        vim.keymap.set('n', '<leader>e', '<cmd>Lspsaga diagnostic_jump_next<CR>')
        vim.keymap.set('n', '<leader>E', '<cmd>Lspsaga diagnostic_jump_prev<CR>')

        vim.keymap.set('n', '<C-k>', '<cmd>lua vim.diagnostic.open_float()<CR>')
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons',     -- optional
    }
}
