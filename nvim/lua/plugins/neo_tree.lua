-- file sidebar
return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    name = "neo-tree",
    opts = {
        window = {
            mappings = {
                -- Support show_path to auto-fill the full base directory the file will be created in (relative to the CWD)
                ["a"] = {
                    "add",
                    config = { show_path = "relative" },
                },
                ["A"] = {
                    "add_directory",
                    config = { show_path = "relative" },
                },
                ["c"] = {
                    "copy",
                    config = { show_path = "relative" },
                },
                ["m"] = {
                    "move",
                    config = { show_path = "relative" },
                },
            },
        },
    },
    config = function(LazyPlugin, opts)
        require(LazyPlugin["name"]).setup(opts)
        -- TODO: Improve neotree
        vim.keymap.set('n', '<leader>f', ':Neotree filesystem toggle reveal_force_cwd<CR>', {})
        vim.keymap.set('n', '<leader>t', ':Neotree focus filesystem<CR>', {})

        -- TODO: Implement auto-NeoTree on opening directories
        -- (I think this already works by default?)
        -- autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

        -- Notable default keybindings
        -- <bs> Navigate up a directory
        -- . navigate into directory

        -- BUG: P (preview) can break background transparency from kanagawa after loading
    end
}
