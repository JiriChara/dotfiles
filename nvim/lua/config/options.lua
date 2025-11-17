local opt = vim.opt

-- Enable line numbers
opt.number = true
opt.relativenumber = true

-- Enable mouse support
opt.mouse = "a"

-- Set clipboard to system clipboard
opt.clipboard = "unnamedplus"

-- Better splits
opt.splitright = true
opt.splitbelow = true

-- Enable true color
opt.termguicolors = true

-- Encoding
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"

-- Undo and backups
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.stdpath("state") .. "/undo"

-- Searching
opt.incsearch = true
opt.hlsearch = true

-- Ignore case unless using capital letters
opt.ignorecase = true
opt.smartcase = true

-- Tabs and indentation
opt.expandtab = true
opt.shiftwidth = 2
opt.tabstop = 2
opt.smartindent = true
opt.autoindent = true
opt.copyindent = true

-- Performance
opt.updatetime = 250 -- faster completion
opt.timeoutlen = 400 -- faster mappings

-- Scrolloff
opt.scrolloff = 4
opt.sidescrolloff = 8

-- Highlight current line/column
opt.cursorline = true
opt.cursorcolumn = true

-- Always show sign column
opt.signcolumn = "yes"

-- Disable line wrap
opt.wrap = false

-- Use a single global status line
opt.laststatus = 3

-- Tab/EOL characters
opt.list = true
opt.listchars = { tab = "▸ ", eol = "¬" }
