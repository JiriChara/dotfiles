return {
  -- ============================
  -- Local Vim settings
  -- ============================
  "thinca/vim-localrc",

  -- ============================
  -- Icons
  -- ============================
  {
    "nvim-tree/nvim-web-devicons",
    lazy = false,
    priority = 1000,
  },

  -- ============================
  -- Statusline
  -- ============================
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup()
    end
  },

  -- ============================
  -- File / System Navigation
  -- ============================
  { "junegunn/fzf", dir = "~/.fzf", build = "./install --all" },
  "junegunn/fzf.vim",
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup()
    end
  },

  -- ============================
  -- File operations
  -- ============================
  "tpope/vim-eunuch",  -- move, copy, remove files

  -- ============================
  -- Git
  -- ============================
  "tpope/vim-fugitive",

  -- ============================
  -- Logs / Monitoring
  -- ============================
  "vim-scripts/TailMinusF",

  -- ============================
  -- Auto add closing statements
  -- ============================
  "tpope/vim-endwise",

  -- ============================
  -- Text transformations
  -- ============================
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
    end,
  },

  -- ============================
  -- Text navigation / motions
  -- ============================
  {
    "Lokaltog/vim-easymotion",
    lazy = false,
    init = function()
      vim.g.EasyMotion_leader_key = '<space>'
    end,
  },

  -- ============================
  -- Syntax / Language support
  -- ============================
  "tpope/vim-markdown",
  "vim-ruby/vim-ruby",
  "pangloss/vim-javascript",
  "leafgarland/typescript-vim",
  "maxmellon/vim-jsx-pretty",
  "peitalin/vim-jsx-typescript",
  "Quramy/vim-js-pretty-template",
  "jparise/vim-graphql",

  -- ============================
  -- IDE / LSP
  -- ============================
  {
    "neoclide/coc.nvim",
    branch = "release",
    lazy = false,
  },

  -- ============================
  -- Save as Sudo
  -- ============================
  "lambdalisue/suda.vim",

  -- ============================
  -- Colorscheme
  -- ============================
  "morhetz/gruvbox",
}
