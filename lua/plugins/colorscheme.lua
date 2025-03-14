return {
  {
    "slugbyte/lackluster.nvim",
    lazy = false,
    priority = 1000,
    init = function()
      local lackluster = require("lackluster")

      lackluster.setup({
        tweak_color = {},
        tweak_syntax = {},
        tweak_background = {
          normal = "default", -- transparent
          -- normal = '#a1b2c3',    -- hexcode
          -- normal = color.green,    -- lackluster color
          telescope = "default", -- telescope
          menu = lackluster.color.gray3,
          popup = "default", -- lazy, mason, whichkey ... (bad idea to transparent)
        },
        tweak_highlight = {
          -- modify @keyword's highlights to be bold and italic
          ["@keyword"] = {
            overwrite = false, -- overwrite falsey will extend/update lackluster's defaults (nil also does this)
            bold = true,
            italic = true,
            -- see `:help nvim_set_hl` for all possible keys
          },
          -- overwrite @function to link to @keyword
          ["@function"] = {
            overwrite = true, -- overwrite == true will force overwrite lackluster's default highlights
            link = "@keyword",
          },
        },
      })
      vim.cmd.colorscheme("lackluster-hack")
      -- vim.cmd.colorscheme("lackluster-hack") -- my favorite
      -- vim.cmd.colorscheme("lackluster-mint")
    end,
  },
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
      colorscheme = "lackluster-hack",
    },
  },
}
