-- kanagawa color scheme
return {
    "rebelot/kanagawa.nvim",
    lazy = false,
    name = "kanagawa",
    opts = {
        transparent = true,
    },
    config = function(LazyPlugin, opts)
        require(LazyPlugin["name"]).setup(opts)
        vim.cmd.colorscheme "kanagawa-wave"
    end
}
