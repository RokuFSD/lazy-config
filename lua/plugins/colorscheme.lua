return {
  {
    "shaunsingh/nord.nvim",
    lazy = false,
    priority = 1000,
  },
  -- {
  --   "slugbyte/lackluster.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   init = function()
  --     local lackluster = require("lackluster")
  --
  --     lackluster.setup({
  --       tweak_syntax = {
  --         comment = lackluster.color.gray4,
  --       },
  --       tweak_background = {
  --         normal = "none", -- transparent
  --         -- normal = '#a1b2c3',    -- hexcode
  --         -- normal = color.green,    -- lackluster color
  --         telescope = "default", -- telescope
  --         menu = lackluster.color.gray3,
  --         popup = "default", -- lazy, mason, whichkey ... (bad idea to transparent)
  --       },
  --     })
  --     vim.cmd.colorscheme("lackluster-hack")
  --     -- vim.cmd.colorscheme("lackluster-hack") -- my favorite
  --     -- vim.cmd.colorscheme("lackluster-mint")
  --   end,
  -- },
  -- {
  --   "AlexvZyl/nordic.nvim",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     require("nordic").load()
  --   end,
  -- },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "nord",
    },
  },
}
