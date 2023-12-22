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
        incremental_selection = { enable = true },  
    },
    config = function(LazyPlugin, opts)
      require("nvim-treesitter.configs").setup(opts) 
    end
}
