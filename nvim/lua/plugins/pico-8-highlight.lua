return {
    'Bakudankun/PICO-8.vim',
    opts = {
        imitate_console = 0,
        use_keymap = 0,
        colorize_graphics = 0,
    },
    config = function(LazyPlugin, opts)
        vim.g.pico8_config = opts
    end
}
