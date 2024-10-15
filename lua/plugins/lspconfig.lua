return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    setup = {
      biome = function()
        require("lazyvim.util").lsp.on_attach(function(client)
          if client.name == "biome" then
            client.server_capabilities.documentFormattingProvider = true
          elseif client.name == "vtsls" then
            client.server_capabilities.documentFormattingProvider = false
          end
        end)
      end,
    },
  },
}
