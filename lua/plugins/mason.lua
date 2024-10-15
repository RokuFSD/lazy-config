local function biome_lsp_or_prettier(bufnr)
  local has_biome_lsp = vim.lsp.get_clients({
    bufnr = bufnr,
    name = "biome",
  })[1]
  if has_biome_lsp then
    return {}
  end
  local has_prettier = vim.fs.find({
    -- https://prettier.io/docs/en/configuration.html
    ".prettierrc",
    ".prettierrc.json",
    ".prettierrc.yml",
    ".prettierrc.yaml",
    ".prettierrc.json5",
    ".prettierrc.js",
    ".prettierrc.cjs",
    ".prettierrc.toml",
    "prettier.config.js",
    "prettier.config.cjs",
  }, { upward = true })[1]
  if has_prettier then
    return { "prettier" }
  end
  return { "biome" }
end

return {
  "stevearc/conform.nvim",
  opts = {
    -- LazyVim will use these options when formatting with the conform.nvim formatter
    default_format_opts = {
      timeout_ms = 3000,
      async = false, -- not recommended to change
      quiet = false, -- not recommended to change
      lsp_format = "fallback", -- not recommended to change
    },
    ---@type table<string, conform.FormatterUnit[]>
    formatters_by_ft = {
      lua = { "stylua" },
      fish = { "fish_indent" },
      sh = { "shfmt" },
      php = { "php-cs-fixer" },
      ["javascript"] = biome_lsp_or_prettier,
      ["javascriptreact"] = biome_lsp_or_prettier,
      ["typescript"] = biome_lsp_or_prettier,
      ["typescriptreact"] = biome_lsp_or_prettier,
      ["vue"] = biome_lsp_or_prettier,
      ["css"] = biome_lsp_or_prettier,
      ["scss"] = { "biome" },
      ["less"] = { "biome" },
      ["html"] = { "biome" },
      ["json"] = { "biome" },
      ["jsonc"] = { "biome" },
      ["yaml"] = { "biome" },
      ["markdown"] = { "biome" },
      ["markdown.mdx"] = { "biome" },
      ["graphql"] = { "biome" },
      ["handlebars"] = { "biome" },
    },
    -- The options you set here will be merged with the builtin formatters.
    -- You can also define any custom formatters here.
    ---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
    formatters = {
      injected = { options = { ignore_errors = true } },
      ["php-cs-fixer"] = {
        command = "php-cs-fixer",
        args = {
          "fix",
          "--rules=@PSR12", -- Formatting preset. Other presets are available, see the php-cs-fixer docs.
          "$FILENAME",
        },
        stdin = false,
      },
      -- # Example of using dprint only when a dprint.json file is present
      -- dprint = {
      --   condition = function(ctx)
      --     return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
      --   end,
      -- },
      --
      -- # Example of using shfmt with extra args
      -- shfmt = {
      --   prepend_args = { "-i", "2", "-ci" },
      -- },
    },
  },
}
