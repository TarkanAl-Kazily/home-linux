-- init.lua is automatically loaded by Lua as part of starting neovim
-- Neovim Lua + Vimscript documentation: https://neovim.io/doc/user/lua.html#lua-vimscript

-------------------------------------------------------------------------------
-- Standard VIM options
-------------------------------------------------------------------------------

-- leader character configuration
vim.g.mapleader = ","

-- replaces tabs with spaces
-- configures default tab size
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- autoindent
vim.o.ai = true
vim.o.si = true
-- line wrap control
vim.o.wrap = false
vim.o.lbr = true

vim.o.hlsearch = true

-- turns on the cursor tracker
vim.o.ruler = true
vim.o.number = true

-- Enables cool clipboard integration
-- TODO: Fix clipboard integration
vim.o.clipboard = unnamedplus

-- TODO: Do these do things anymore?
vim.o.updatetime = 500
vim.o.modeline = true

-- text handling
vim.o.encoding = "utf8"

-- disable mouse (TODO: for now?)
vim.o.mouse = false

-------------------------------------------------------------------------------
-- Plugins --
-- lazy.nvim plugin manager: https://github.com/folke/lazy.nvim
-------------------------------------------------------------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Pull plugin configuration from lua/plugins/*.lua (which all are mreged together)
require("lazy").setup("plugins")
