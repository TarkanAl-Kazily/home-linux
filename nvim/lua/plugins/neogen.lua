-- comment template generator
return { 
    "danymat/neogen", 
    dependencies = "nvim-treesitter/nvim-treesitter", 
    opts = {
        languages = {
            python = {
                -- https://google.github.io/styleguide/pyguide.html
                template = { annotation_convention = "google_docstrings" },
            },
        },
    },
    config = function(LazyPlugin, opts)
        require('neogen').setup(opts)
        local k_opts = { noremap = true, silent = true }
        vim.api.nvim_set_keymap("n", "<leader>c", ":lua require('neogen').generate()<CR><ESC>", k_opts)
    end
}
