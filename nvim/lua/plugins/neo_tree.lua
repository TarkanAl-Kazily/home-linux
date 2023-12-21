-- file sidebar
return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        -- TODO: Improve neotree
        vim.keymap.set('n', '<leader>f', ':Neotree filesystem toggle reveal_force_cwd<CR>', {})
        vim.keymap.set('n', '<leader>t', ':Neotree focus filesystem<CR>', {})
    end
}
