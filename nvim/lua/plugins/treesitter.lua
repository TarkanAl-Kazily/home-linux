-- code formatting and highlighting
return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "arduino",
            "bash",
            "c",
            "cpp",
            "dockerfile",
            "dot",
            "doxygen",
            "git_config",
            "git_rebase",
            "gitattributes",
            "gitcommit",
            "gitignore",
            "html",
            "java",
            "javascript",
            "json",
            "json5",
            "jsonc",
            "kconfig",
            "latex",
            "lua",
            "make",
            "markdown",
            "markdown_inline",
            "ninja",
            "objc",
            "objdump",
            "python",
            "ssh_config",
            "starlark",
            "t32",
            "udev",
            "vim",
            "vimdoc",
            "xml",
            "yaml",
        },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
            disable = function(lang, buf)
                -- Disable slow treesitter highlighting for large files
                local max_filesize = 100 * 1024 -- 100 KB
                local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
                if ok and stats and stats.size > max_filesize then
                    return true
                end
            end,
        },
        indent = { enable = true },  
        incremental_selection = {
            -- Automatically select a node in visual mode (function, class, etc)
            enable = true,
            keymaps = {
                init_selection = "<CR>", -- set to `false` to disable one of the mappings
                scope_incremental = "<CR>",
                node_incremental = "<TAB>",
                node_decremental = "<S-TAB>",
            },
        },  
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    -- You can use the capture groups defined in textobjects.scm
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                    ["ac"] = "@class.outer",
                    ["ic"] = "@class.inner",
                    ["aa"] = "@parameter.outer",
                    ["ia"] = "@parameter.inner",
                    ["ai"] = "@conditional.outer",
                    ["ii"] = "@conditional.inner",
                    ["al"] = "@loop.outer",
                    ["il"] = "@loop.inner",
                    ["ab"] = "@block.outer",
                    ["ib"] = "@block.inner",
                    ["ar"] = "@return.outer",
                    ["ir"] = "@return.inner",
                    -- You can also use captures from other query groups like `locals.scm`
                    ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
                },
                -- BUG: These selection modes should switch a select capture to be by lines, but it's broken
                -- https://github.com/nvim-treesitter/nvim-treesitter-textobjects/issues/515
                selection_modes = {
                    ['@function.inner'] = 'V',
                    ['@function.outer'] = 'V',
                    ['@class.inner'] = 'V',
                    ['@class.outer'] = 'V',
                },
                -- If you set this to `true` (default is `false`) then any textobject is
                -- extended to include preceding or succeeding whitespace. Succeeding
                -- whitespace has priority in order to act similarly to eg the built-in
                -- `ap`.
                --
                -- Can also be a function which gets passed a table with the keys
                -- * query_string: eg '@function.inner'
                -- * selection_mode: eg 'v'
                -- and should return true of false
                include_surrounding_whitespace = true,
            },
            move = {
                enable = true,
                set_jumps = true, -- whether to set jumps in the jumplist
                goto_next_start = {
                    ["]m"] = "@function.outer",
                    ["]]"] = { query = "@class.outer", desc = "Next class start" },
                    --
                    -- You can use regex matching (i.e. lua pattern) and/or pass a list in a "query" key to group multiple queires.
                    ["]o"] = "@loop.*",
                    -- ["]o"] = { query = { "@loop.inner", "@loop.outer" } }
                    --
                    -- You can pass a query group to use query from `queries/<lang>/<query_group>.scm file in your runtime path.
                    -- Below example nvim-treesitter's `locals.scm` and `folds.scm`. They also provide highlights.scm and indent.scm.
                    ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
                    ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
                },
                goto_next_end = {
                    ["]M"] = "@function.outer",
                    ["]["] = "@class.outer",
                },
                goto_previous_start = {
                    ["[m"] = "@function.outer",
                    ["[["] = "@class.outer",
                },
                goto_previous_end = {
                    ["[M"] = "@function.outer",
                    ["[]"] = "@class.outer",
                },
                -- Below will go to either the start or the end, whichever is closer.
                -- Use if you want more granular movements
                -- Make it even more gradual by adding multiple queries and regex.
                goto_next = {
                    ["]d"] = "@conditional.outer",
                },
                goto_previous = {
                    ["[d"] = "@conditional.outer",
                }
            },
        }
    },
    config = function(LazyPlugin, opts)
        require("nvim-treesitter.configs").setup(opts) 
    end
}
