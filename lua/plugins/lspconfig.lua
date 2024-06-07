return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    setup = {
      eslint = function()
        require("lazyvim.util").lsp.on_attach(function(client)
          if client.name == "eslint" then
            client.server_capabilities.documentFormattingProvider = true
          else -- NOTE: disables vtsls for formatting
            -- elseif client.name == "tsserver" then
            client.server_capabilities.documentFormattingProvider = false
          end
        end)
      end,
    },
  },
}
