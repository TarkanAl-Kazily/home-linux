-- artful ASCII diagram drawing tool
return {
    "jbyuki/venn.nvim",
    config = function()
        -- Use :set ve=all to enable free roaming of the cursor
        -- Then use ,b to turn your selections into lines and boxes!
        vim.keymap.set('v', '<leader>b', ":VBox<CR>", {})
    end,
}
