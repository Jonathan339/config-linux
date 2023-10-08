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
-- Leader/local leader - lazy.nvim needs these set first
vim.g.mapleader = ","
vim.g.maplocalleader = ","
vim.loader.enable()
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)
require("lazy").setup("plugins")
