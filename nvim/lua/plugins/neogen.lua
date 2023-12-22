-- comment template generator
return { 
    "danymat/neogen", 
    dependencies = "nvim-treesitter/nvim-treesitter", 
    opts = {},
    config = function(LazyPlugin, opts)
        require('neogen').setup(opts)
        local k_opts = { noremap = true, silent = true }
        vim.api.nvim_set_keymap("n", "<leader>c", ":lua require('neogen').generate()<CR><ESC>", k_opts)
    end
}
