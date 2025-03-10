return {
  {
    "amrbashir/nvim-docs-view",
    lazy = true,
    cmd = "DocsViewToggle",
    opts = {
      position = "right",
      width = 60,
    },
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      background_colour = "#1a1b26",
      timeout = 5000,
    },
  },

  -- buffer line
  -- {
  --   "akinsho/bufferline.nvim",
  --   event = "VeryLazy",
  --   keys = {
  --     { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
  --     { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
  --   },
  --   opts = {
  --     options = {
  --       mode = "tabs",
  --       -- separator_style = "slant",
  --       show_buffer_close_icons = false,
  --       show_close_icon = false,
  --     },
  --   },
  -- },
  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },
  {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
      scroll = { enabled = false },
      scratch = {
        ft = "markdown",
      },
      picker = {
        matcher = {
          fuzzy = true,
          smartcase = true,
          ignorecase = true,
          filename_bonus = true,
        },
      },
      sources = {
        explorer = {
          matcher = {
            fuzzy = true, -- Enables fuzzy matching, so you can be a bit imprecise with your search terms
            smartcase = true, -- If your search term has uppercase letters, the search becomes case-sensitive
            ignorecase = true, -- Ignores case when searching, unless smartcase is triggered
            filename_bonus = true, -- Gives a higher priority to matches in filenames
            sort_empty = false, -- If no matches are found, it won't sort the results
          },
        },
      },
    },
  },
  {
    "saghen/blink.cmp",
    lazy = true,
    opts = {

      completion = {
        list = {
          selection = {
            preselect = false,
            auto_insert = false,
          },
        },
      },
    },
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy", -- Load this plugin on the 'VeryLazy' event
    requires = { "nvim-tree/nvim-web-devicons", opt = true }, -- Optional dependency for icons
    opts = {
      options = {
        icons_enabled = true, -- Enable icons in the statusline
      },
      sections = {
        lualine_a = {
          {
            "mode", -- Display the current mode
            icon = "󱗞", -- Set the icon for the mode
          },
        },
      },
    },
  },
}
