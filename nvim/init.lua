-- Safely enable Neovim's Lua module loader (speeds up startup; won't error on older versions)
pcall(vim.loader.enable)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("config.lazy")
require("config.lsp")
require("config.globals")
require("config.keymaps")
require("config.autocmds")
