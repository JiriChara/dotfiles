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
      vim.g.powerline_loaded = 1
      vim.g.airline_symbols_ascii = 0
      vim.g["airline#extensions#coc#enabled"] = 1
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
  {
    "mg979/vim-visual-multi",
    branch = "master",
    lazy = false,
    init = function()
      vim.g.VM_maps = {
        ["Find Under"] = "<C-c>",
        ["Find Subword Under"] = "<C-c>",
      }
    end
  },

  -- Text navigation
  {
    "Lokaltog/vim-easymotion",
    lazy = false,
    init = function()
      vim.g.EasyMotion_leader_key = '<space>'
    end
  },

  -- Syntax
  "tpope/vim-markdown",
  "vim-ruby/vim-ruby",
  "pangloss/vim-javascript",
  "leafgarland/typescript-vim",
  "maxmellon/vim-jsx-pretty",
  "peitalin/vim-jsx-typescript",
  "Quramy/vim-js-pretty-template",
  "jparise/vim-graphql",

  -- IDE
  {
    "neoclide/coc.nvim",
    branch = "release",
    lazy = false
  },

  -- Save as Sudo
  "lambdalisue/suda.vim",

  -- Colorscheme
  "morhetz/gruvbox",
}
