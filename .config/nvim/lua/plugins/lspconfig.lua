local utils = require("utils._set_mappings")
local lspconfig = require("lspconfig")
local cmp = require("cmp_nvim_lsp")
local capabilities = cmp.default_capabilities()

--require("lspconfig").jedi_language_server.setup {
--  capabilities = capabilities
--}




-- https://zenn.dev/botamotch/articles/21073d78bc68bf

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings.
  -- See `:help vim.diagnostic.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set("n", "<space>e", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
  --vim.keymap.set("n", "<space>q", vim.diagnostic.setloclist, opts)
  vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
  vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
  vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set("n", "<space>wa", vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set("n", "<space>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, bufopts)
  vim.keymap.set("n", "<space>ca", vim.lsp.buf.code_action, bufopts)
  vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
  vim.keymap.set("n", "<space>f", function() vim.lsp.buf.format { async = true } end, bufopts)
end


local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}
-- require("lspconfig")["jedi_language_server"].setup{
--     on_attach = on_attach,
--     flags = lsp_flags,
-- }
require("lspconfig")["tsserver"].setup{
    on_attach = on_attach,
    flags = lsp_flags,
}
require("lspconfig")["rust_analyzer"].setup{
    on_attach = on_attach,
    flags = lsp_flags,
    -- Server-specific settings...
    settings = {
      ["rust-analyzer"] = {}
    }
}
--require("lspconfig")["yamlls"].setup{
lspconfig.yamlls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    yaml = {
      schemas = {
        ["https://raw.githubusercontent.com/quantumblacklabs/kedro/develop/static/jsonschema/kedro-catalog-0.17.json"]= "conf/**/*catalog*",
        ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*"
      },
      schemaStore = {
        enable = true
      }
    }
  }
}
lspconfig.emmet_ls.setup({
  -- on_attach = on_attach,
  capabilities = vim.lsp.protocol.make_client_capabilities(),
  --capabilities.textDocument.completion.completionItem.snippetSupport = true,
  filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
  init_options = {
    html = {
      options = {
        -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
        ["bem.enabled"] = true,
      },
    },
  }
})


return function()
  local utils = require("utils._set_config")
  local conf_lsp = utils.conf_lsp

  vim.diagnostic.config({
    virtual_text = false,
  })
  vim.o.updatetime = 250
  vim.cmd([[autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]])

  -- mapping
  local servers = {
	  --"denols",
	  --"gopls",
    --"jsonls",
		--"rust_analyzer",
    --"sumneko_lua",
	  --"tflint",
	  --"tsserver",
	  --"yamlls",
	  --"zls",
    "jedi_python",
  }

  for _, lsp in ipairs(servers) do
    conf_lsp(lsp)
  end
end
