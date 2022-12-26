require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

-- https://zenn.dev/botamotch/articles/21073d78bc68bf
require("mason-lspconfig").setup_handlers({ function(server)
  local opt = {
    capabilities = require('cmp_nvim_lsp').default_capabilities(
      vim.lsp.protocol.make_client_capabilities()
    )
  }
  --require('lspconfig')[server].setup(opt)
end })
