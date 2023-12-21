-- file finder
return {
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        -- TODO: Improve telescope
        --   * Fully replace NERDTree <leader>f ?
        --   * Fix live grep
        local ts_builtin = require("telescope.builtin")
        vim.keymap.set('n', '<C-p>', ts_builtin.find_files, {})
        -- vim.keymap.set('n', '<leader>fg', ts_builtin.live_grep, {})
    end,
}
