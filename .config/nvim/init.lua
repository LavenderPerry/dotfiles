-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  print("installing lazy.nvim...")

  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath
  })

  vim.cmd("redraw")
  print("lazy.nvim has been installed")
end
vim.opt.rtp:prepend(lazypath)

-- Set options not related to or managed by specific plugins (see lua/options.lua)
for opt, val in pairs(require("options")) do
  vim.opt[opt] = val
end

-- Space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Install/load plugins (see lua/plugins/)
require("lazy").setup("plugins")
