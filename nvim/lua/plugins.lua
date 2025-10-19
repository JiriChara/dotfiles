return {
  -- Local Vim settings
  "thinca/vim-localrc",

  -- Icons
  {
    "nvim-tree/nvim-web-devicons",
    lazy = false,
    priority = 1000
  },

  -- Airline
  {
    "vim-airline/vim-airline",
    dependencies = {
      "vim-airline/vim-airline-themes",
      "ryanoasis/vim-devicons"
    },
    lazy = false,
    priority = 1000,
    init = function()
      vim.g.airline_powerline_fonts = 1
    end
  },

  -- File/System Navigation
  { "junegunn/fzf", dir = "~/.fzf", build = "./install --all" },
  "junegunn/fzf.vim",
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
    end
  },

  -- Move, Copy, Remove files
  "tpope/vim-eunuch",

  -- Git
  "tpope/vim-fugitive",

  -- Logs
  "vim-scripts/TailMinusF",

  -- Auto add closing statements
  "tpope/vim-endwise",

  -- Text transformation
  "tpope/vim-abolish",
  "tpope/vim-surround",
  "tpope/vim-commentary",
  "JiriChara/dragvisuals.vim",
  { "mg979/vim-visual-multi", branch = "master" },

  -- Text navigation
  "Lokaltog/vim-easymotion",

  -- Syntax
  "tpope/vim-markdown",
  "vim-ruby/vim-ruby",
  "pangloss/vim-javascript",
  "leafgarland/typescript-vim",
  "maxmellon/vim-jsx-pretty",
  "peitalin/vim-jsx-typescript",
  "Quramy/vim-js-pretty-template",
  "jparise/vim-graphql",

  -- Text complete
  { "neoclide/coc.nvim", branch = "release" },

  -- Save as Sudo
  "lambdalisue/suda.vim",

  -- Colorscheme
  "morhetz/gruvbox",
}
