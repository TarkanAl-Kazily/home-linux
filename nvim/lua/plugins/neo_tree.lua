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
        filesystem = {
            window = {
                mappings = {
                    ["<bs>"] = "navigate_up",
                    ["."] = "set_root",
                    ["H"] = "toggle_hidden",
                    ["/"] = "fuzzy_finder",
                    ["D"] = "fuzzy_finder_directory",
                    ["#"] = "fuzzy_sorter", -- fuzzy sorting using the fzy algorithm
                    -- ["D"] = "fuzzy_sorter_directory",
                    ["f"] = "filter_on_submit",
                    ["<c-x>"] = "clear_filter",
                    ["[g"] = "prev_git_modified",
                    ["]g"] = "next_git_modified",
                    ["o"] = { "show_help", nowait=false, config = { title = "Order by", prefix_key = "o" }},
                    ["oc"] = { "order_by_created", nowait = false },
                    ["od"] = { "order_by_diagnostics", nowait = false },
                    ["og"] = { "order_by_git_status", nowait = false },
                    ["om"] = { "order_by_modified", nowait = false },
                    ["on"] = { "order_by_name", nowait = false },
                    ["os"] = { "order_by_size", nowait = false },
                    ["ot"] = { "order_by_type", nowait = false },
                },
                fuzzy_finder_mappings = { -- define keymaps for navigation during filter popup window in fuzzy_finder_mode
                    ["<down>"] = "move_cursor_down",
                    ["<C-n>"] = "move_cursor_down",
                    ["<up>"] = "move_cursor_up",
                    ["<C-p>"] = "move_cursor_up",
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
