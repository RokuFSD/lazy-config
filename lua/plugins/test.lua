return {
  {
    "thenbe/neotest-playwright",
  },
  {
    "nvim-neotest/neotest",
    opts = {
      adapters = {
        ["thenbe/neotest-playwright"] = {
          persist_project_selection = true,
          enable_dynamic_test_discovery = true,
        },
      },
      status = { virtual_text = true },
      output = { open_on_run = true },
      quickfix = {
        open = function()
          if require("lazyvim.util").has("trouble.nvim") then
            vim.cmd("Trouble quickfix")
          else
            vim.cmd("copen")
          end
        end,
      },
    },
  },
  {
    "folke/which-key.nvim",
    optional = true,
    spec = {
      defaults = {
        ["<leader>t"] = { name = "+test" },
      },
    },
  },
}
