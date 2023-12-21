-- highlighting todos with treesitter
return {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
        -- TODO: Improve default pattern match to handle this example:
        -- TODO(T1234): test
        pattern = [[\b(KEYWORDS):]],
        -- keyword examples
        -- TODO:
        -- HACK:
        -- WARN:
        -- PERF:
        -- NOTE:
        -- TEST:
    }
}
