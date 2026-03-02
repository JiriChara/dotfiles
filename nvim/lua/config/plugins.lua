return {
  -- Colorscheme
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup()
      vim.cmd("colorscheme catppuccin")
    end,
  },

  -- Status Line
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup()
    end,
  },

  -- File / System Navigation
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("nvim-tree").setup({
        diagnostics = {
          enable = true,
        },
        renderer = {
          highlight_diagnostics = "all", -- color the filename based on error diagnostics
        },
      })
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        pickers = {
          find_files = {
            hidden = true,
          },
        },
        defaults = {
          mappings = {
            i = {
              ["<C-j>"] = "move_selection_next",
              ["<C-k>"] = "move_selection_previous",
            },
          },
        },
      })
    end,
  },

  -- Display Keybindings in Popup
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    keys = {
      {
        "<leader>?",
        function()
          require("which-key").show({ global = true })
        end,
        desc = "Buffer Local Keymaps (which-key)",
      },
    },
  },

  -- Syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.config").setup({
        highlight = {
          enable = true,
        },
        incremental_selection = {
          enabled = true,
        },
        indent = {
          enabled = true,
        },
        ensure_installed = {
          "c",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "markdown",
          "markdown_inline",
          "javascript",
          "json",
          "typescript",
          "css",
          "vue",
        },
        sync_install = false,
        auto_install = true,
      })
    end,
  },

  -- LSP
  {
    "mason-org/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "mason-org/mason-lspconfig.nvim",
    dependencies = { "mason-org/mason.nvim", "neovim/nvim-lspconfig" },
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "ts_ls", "vue_ls", "eslint" },
        automatic_enable = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "mason-org/mason.nvim",
      "nvimtools/none-ls.nvim",
    },
    automatic_installation = true,
    config = function()
      require("mason-null-ls").setup({
        ensure_installed = { "stylua", "prettierd", "isort", "black", "eslint_d" },
      })
    end,
  },

  -- For autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      -- load vscode-style snippets
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),

          -- Tab to navigate + expand snippets
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),

        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "nvim_lua" },
          {
            name = "path",
            option = {
              pathMappings = {
                ["/"] = "${folder}/",
              },
            },
          },
          {
            { name = "buffer" },
          },
        }),
      })
    end,
  },

  -- Formatting
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")

      conform.setup({
        formatters_by_ft = {
          javascript = { "prettierd", "eslint_d" },
          typescript = { "prettierd", "eslint_d" },
          javascriptreact = { "prettierd", "eslint_d" },
          typescriptreact = { "prettierd", "eslint_d" },
          svelte = { "prettierd", "eslint_d" },
          vue = { "prettierd", "eslint_d" },
          css = { "prettierd" },
          html = { "prettierd" },
          json = { "prettierd" },
          yaml = { "prettierd" },
          markdown = { "prettierd" },
          graphql = { "prettierd" },
          lua = { "stylua" },
          python = { "isort", "black" },
        },
        async = true,
        format_on_save = {
          lsp_format = "fallback",
          timeout_ms = 500,
        },
        format_after_save = {
          lsp_format = "fallback",
        },
      })
    end,
  },

  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
  },

  {
    "andymass/vim-matchup",
    event = "VeryLazy",
    init = function()
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },

  -- Git
  {
    "tpope/vim-fugitive",
    cmd = {
      "Git",
      "G",
      "Gdiffsplit",
      "Gvdiffsplit",
      "Gread",
      "Gwrite",
      "Ggrep",
      "GMove",
      "GDelete",
      "GBrowse",
      "Gclog",
      "Gedit",
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("gitsigns").setup({
        current_line_blame = true,
        current_line_blame_opts = {
          delay = 250,
        },
      })
    end,
  },

  -- Text transformation
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
  },

  -- File operations
  {
    "tpope/vim-eunuch",
    cmd = {
      "Rename",
      "Move",
      "Delete",
      "Chmod",
      "Mkdir",
      "Copy",
      "SudoEdit",
      "SudoWrite",
    },
  },

  -- Search and Replace
  {
    "MagicDuck/grug-far.nvim",
    config = function()
      require("grug-far").setup({})
    end,
  },

  -- Trouble/TODO/FIX hightlighting
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
  },

  -- Diagnostics helper
  {
    "NickStafford2/copy-diagnostics.nvim",
    config = function()
      vim.g.copy_diagnostics_configuration = {
        keymap = {
          all = "<Leader>cy",
          cursor = "<Leader>cY",
        },
      }
    end,
  },
}
